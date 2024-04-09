class AddUniqueToGuidColumns < ActiveRecord::Migration[7.1]
  def change
    add_index :films, :tmdbMovieId, unique: true
    add_index :reviews, :guid, unique: true
    add_index :lists, :guid, unique: true
  end
end
