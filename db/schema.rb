# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_12_115437) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ship_to_another_id"
    t.integer "payment"
    t.integer "total_price"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_to_another_id"], name: "index_carts_on_ship_to_another_id"
    t.index ["updated_at"], name: "index_carts_on_updated_at"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_name"], name: "index_genres_on_genre_name"
  end

  create_table "item_carts", force: :cascade do |t|
    t.integer "item_id"
    t.integer "cart_id"
    t.integer "count"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_item_carts_on_cart_id"
    t.index ["item_id"], name: "index_item_carts_on_item_id"
  end

  create_table "ship_to_anothers", force: :cascade do |t|
    t.string "first_name", limit: 20, null: false
    t.string "last_name", limit: 20, null: false
    t.string "first_name_kana", limit: 20, null: false
    t.string "last_name_kana", limit: 20, null: false
    t.string "postal_code", limit: 7, null: false
    t.string "address", limit: 300, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
