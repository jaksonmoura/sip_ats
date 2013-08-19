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

ActiveRecord::Schema.define(version: 20130819192154) do

  create_table "computers", force: true do |t|
    t.integer  "dpto_id"
    t.integer  "subdpto_id"
    t.string   "sort"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ip"
  end

  create_table "dptos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbr"
  end

  create_table "equipment", force: true do |t|
    t.integer  "dpto_id"
    t.integer  "subdpto_id"
    t.string   "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ip"
  end

  create_table "subdptos", force: true do |t|
    t.string   "name"
    t.integer  "dpto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbr"
  end

  create_table "users", force: true do |t|
    t.string   "nickname"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
