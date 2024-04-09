# frozen_string_literal: true

class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.string :tmdbMovieId
      t.string :title
      t.string :year

      t.timestamps
    end
  end
end
