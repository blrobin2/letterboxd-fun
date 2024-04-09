# frozen_string_literal: true

class Feedjira::Parser::RSSEntry
    element "letterboxd:watchedDate", as: :watched_date
    element "letterboxd:rewatch", as: :rewatch
    element "letterboxd:filmTitle", as: :film_title
    element "letterboxd:filmYear", as: :film_year
    element "letterboxd:memberRating", as: :member_rating
    element "tmdb:movieId", as: :tmdbMovieId
end

class LetterboxdContentImporter
  include Enumerable

  def initialize
    url = "https://letterboxd.com/blrobin2/rss/"
    xml = HTTParty.get(url).body
    @feed = Feedjira.parse(xml)
  end

  def import_items
    each { |item| import_item(item) }
    nil
  end

  def import_item(item)
    pp item.film_title
    guid = item.entry_id
    if guid.include? "-list-"
        import_list(item)
    elsif guid.include? "-review-"
        import_review(item)
    else
        pp guid
    end
  end

  def import_list(item)
    List.find_or_create_by(guid: item.entry_id) do |new_list|
        new_list.title = item.title
        new_list.link = item.url
        new_list.pubDate = item.published
    end
  end

  def import_review(item)
    film = Film.find_or_create_by(tmdbMovieId: item.tmdbMovieId) do |new_film|
        new_film.title = item.film_title
        new_film.year = item.film_year
    end


    Review.find_or_create_by(guid: item.entry_id) do |new_review|
        new_review.title = item.title
        new_review.link = item.url
        new_review.pubDate = item.published
        new_review.watchedDate = item.watched_date
        new_review.rewatch = item.rewatch
        new_review.memberRating = item.member_rating
        new_review.creator = item.author
        new_review.content = item.content
        new_review.film = film
    end
  end

  def each
    for feed_item in @feed.entries do
        yield feed_item
    end
  end
end
