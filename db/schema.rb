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

ActiveRecord::Schema.define(version: 2020_12_30_185331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "base_experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trades", force: :cascade do |t|
    t.boolean "is_fair"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "offer_player_1", default: [], array: true
    t.json "offer_player_2", default: [], array: true
    t.integer "offer_1_experience"
    t.integer "offer_2_experience"
    t.bigint "player_1_id", null: false
    t.bigint "player_2_id", null: false
    t.index ["player_1_id"], name: "index_trades_on_player_1_id"
    t.index ["player_2_id"], name: "index_trades_on_player_2_id"
  end

  add_foreign_key "trades", "players", column: "player_1_id"
  add_foreign_key "trades", "players", column: "player_2_id"
end
