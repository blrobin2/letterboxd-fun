# frozen_string_literal: true

class ListFilm < ApplicationRecord
  belongs_to :film
  belongs_to :list
end
