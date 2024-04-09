# frozen_string_literal: true

class CreateListFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :list_films do |t|
      t.belongs_to :film, null: false, foreign_key: true
      t.belongs_to :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
