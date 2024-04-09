# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_08_213013) do
  create_table "films", force: :cascade do |t|
    t.string "tmdbMovieId"
    t.string "title"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tmdbMovieId"], name: "index_films_on_tmdbMovieId", unique: true
  end

  create_table "list_films", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_list_films_on_film_id"
    t.index ["list_id"], name: "index_list_films_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "guid"
    t.datetime "pubDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guid"], name: "index_lists_on_guid", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "guid"
    t.datetime "pubDate"
    t.datetime "watchedDate"
    t.boolean "rewatch"
    t.string "memberRating"
    t.string "creator"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "film_id"
    t.index ["film_id"], name: "index_reviews_on_film_id"
    t.index ["guid"], name: "index_reviews_on_guid", unique: true
  end

  add_foreign_key "list_films", "films"
  add_foreign_key "list_films", "lists"
end
