require 'open-uri'

class LetterboxdListImporter

    def initialize
        @browser = Watir::Browser.new :chrome
        @lists = List.where.not(id: ListFilm.pluck(:list_id).reject {|x| x.nil?}.uniq)
    end

    def import_lists
        @lists.each { |list| import_list(list) }
    end

    def import_list(list)
        @browser.goto(list.link)
        return unless challenge_list?(@browser)

        doc = @browser.elements(css: '[data-film-name]').wait_until(&:present?)
        doc.each { |item| import_list_item(item, list) }
    end

    def import_list_item(item, list)
        attrs = item.attributes
        film = Film.find_or_create_by(tmdbMovieId: attrs[:data_film_id]) do |new_film|
            new_film.title = attrs[:data_film_name]
            new_film.year = attrs[:data_film_release_year]
        end

        ListFilm.find_or_create_by!(film: film, list: list)
    end

    def challenge_list?(browser)
        browser.elements(css: 'ul.tags a').any? do |item|
            item.text == 'challenge'
        end
    end
end