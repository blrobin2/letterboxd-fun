# frozen_string_literal: true

class Film < ApplicationRecord
  has_many :reviews
  has_many :list_films
  has_many :lists, through: :list_films
end
