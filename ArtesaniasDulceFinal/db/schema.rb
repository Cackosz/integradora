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

ActiveRecord::Schema.define(version: 20160606215828) do

  create_table "categories", force: :cascade do |t|
    t.string   "type_category", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "matters", force: :cascade do |t|
    t.string   "name_matter",     limit: 255
    t.decimal  "price",                       precision: 10
    t.integer  "quantity",        limit: 4
    t.decimal  "total_inversion",             precision: 10
    t.integer  "provider_id",     limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "matters", ["provider_id"], name: "index_matters_on_provider_id", using: :btree

  create_table "pieces", force: :cascade do |t|
    t.string   "piece_name",     limit: 255
    t.integer  "piece_quantity", limit: 4
    t.decimal  "price",                      precision: 10
    t.string   "matter_name",    limit: 255
    t.integer  "category_id",    limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "pieces", ["category_id"], name: "index_pieces_on_category_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.string   "name_enterprise", limit: 255
    t.string   "name_pro",        limit: 255
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "matter",          limit: 255
    t.text     "location",        limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "piece_id",      limit: 4
    t.integer  "sale_quantity", limit: 4
    t.decimal  "total",                   precision: 10
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "sales", ["piece_id"], name: "index_sales_on_piece_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "roles_mask",             limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "matters", "providers"
  add_foreign_key "pieces", "categories"
  add_foreign_key "sales", "pieces"
end
