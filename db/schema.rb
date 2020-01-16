# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_16_000357) do

  create_table "character_sheets", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.text "stats"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dms", force: :cascade do |t|
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "lore"
    t.text "rules"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "summery"
    t.integer "dm_id"
    t.index ["dm_id"], name: "index_games_on_dm_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "notable_type", null: false
    t.integer "notable_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id"
  end

  create_table "players", force: :cascade do |t|
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "games", "dms"
end
