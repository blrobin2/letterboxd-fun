# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :link
      t.string :guid
      t.datetime :pubDate
      t.datetime :watchedDate
      t.boolean :rewatch
      t.string :memberRating
      t.string :creator
      t.text :content

      t.timestamps
    end
  end
end
