# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :link
      t.string :guid
      t.datetime :pubDate

      t.timestamps
    end
  end
end
