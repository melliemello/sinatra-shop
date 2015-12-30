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

ActiveRecord::Schema.define(version: 20151229110834) do

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

end
