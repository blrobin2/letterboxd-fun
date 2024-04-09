# frozen_string_literal: true

class List < ApplicationRecord
  has_many :list_films
  has_many :films, through: :list_films
end
