# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160117112635) do

  create_table "buyings", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  add_index "buyings", ["order_id"], name: "index_buyings_on_order_id"
  add_index "buyings", ["product_id"], name: "index_buyings_on_product_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoryassignments", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categoryassignments", ["category_id"], name: "index_categoryassignments_on_category_id"
  add_index "categoryassignments", ["product_id"], name: "index_categoryassignments_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.string  "fname"
    t.string  "lname"
    t.string  "address"
    t.string  "email"
    t.string  "phone"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "pictures", force: :cascade do |t|
    t.string  "file"
    t.string  "alt"
    t.integer "product_id"
  end

  add_index "pictures", ["product_id"], name: "index_pictures_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.boolean  "featured",    default: false
  end

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "permission_level"
  end

end
