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

ActiveRecord::Schema.define(version: 2020_05_28_120624) do

  create_table "menuitems", force: :cascade do |t|
    t.integer "menuitem_id"
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.integer "menu_id"
    t.float "price"
    t.boolean "active"
    t.integer "quantity"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "menuitem_id"
    t.string "menuitem_name"
    t.integer "menu_item_quantity"
    t.float "menuitem_price"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.integer "user_id"
    t.datetime "delivered_at"
    t.boolean "success"
    t.string "status"
    t.integer "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone"
    t.text "address"
    t.string "password_digest"
    t.string "role"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
