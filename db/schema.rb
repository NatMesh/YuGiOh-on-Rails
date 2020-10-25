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

ActiveRecord::Schema.define(version: 2020_10_25_235403) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "card_type"
    t.text "description"
    t.string "race"
    t.string "archetype"
    t.string "card_image"
    t.string "card_image_small"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monster_cards", force: :cascade do |t|
    t.integer "attack"
    t.integer "defense"
    t.integer "level"
    t.string "monster_attribute"
    t.integer "link_value"
    t.integer "scale"
    t.integer "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_monster_cards_on_card_id"
  end

  add_foreign_key "monster_cards", "cards"
end
