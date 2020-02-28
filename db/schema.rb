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

ActiveRecord::Schema.define(version: 2020_02_28_013000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_teams", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_teams_on_game_id"
  end

  create_table "game_users", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.integer "score"
    t.bigint "game_team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_users_on_game_id"
    t.index ["game_team_id"], name: "index_game_users_on_game_team_id"
    t.index ["user_id"], name: "index_game_users_on_user_id"
  end

  create_table "game_words", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_words_on_game_id"
    t.index ["word_id"], name: "index_game_words_on_word_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "key_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "round"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "game_teams", "games"
  add_foreign_key "game_users", "game_teams"
  add_foreign_key "game_users", "games"
  add_foreign_key "game_users", "users"
  add_foreign_key "game_words", "games"
  add_foreign_key "game_words", "words"
  add_foreign_key "games", "users"
end
