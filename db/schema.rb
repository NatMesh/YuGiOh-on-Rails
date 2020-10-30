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

ActiveRecord::Schema.define(version: 2020_10_30_104045) do

  create_table "card_prices", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "card_seller_id", null: false
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_prices_on_card_id"
    t.index ["card_seller_id"], name: "index_card_prices_on_card_seller_id"
  end

  create_table "card_sellers", force: :cascade do |t|
    t.string "seller_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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

  create_table "link_markers", force: :cascade do |t|
    t.integer "monster_card_id", null: false
    t.integer "marker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["marker_id"], name: "index_link_markers_on_marker_id"
    t.index ["monster_card_id"], name: "index_link_markers_on_monster_card_id"
  end

  create_table "markers", force: :cascade do |t|
    t.string "marker_direction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monster_cards", force: :cascade do |t|
    t.integer "attack", default: 0
    t.integer "defense", default: 0
    t.integer "level", default: 0
    t.string "monster_attribute"
    t.integer "link_value", default: 0
    t.integer "scale", default: 0
    t.integer "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_monster_cards_on_card_id"
  end

  add_foreign_key "card_prices", "card_sellers"
  add_foreign_key "card_prices", "cards"
  add_foreign_key "link_markers", "markers"
  add_foreign_key "link_markers", "monster_cards"
  add_foreign_key "monster_cards", "cards"
end
