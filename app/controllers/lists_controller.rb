class ListsController < ApplicationController
    def challenges
        @lists = List.where(id: ListFilm.pluck(:list_id).reject {|x| x.nil?}.uniq).order(:title)
    end
end
