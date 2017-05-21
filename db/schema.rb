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

ActiveRecord::Schema.define(version: 20170520033410) do

  create_table "captures", force: :cascade do |t|
    t.integer  "unit_id"
    t.integer  "device_id"
    t.string   "name"
    t.text     "notes"
    t.text     "binary"
    t.text     "original_binary"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "challenge_attempts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.string   "guess"
    t.boolean  "correct"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "solution"
    t.string   "filepath"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "scenario_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "fcc_id"
    t.string   "baudrate"
    t.float    "frequency"
    t.string   "modulation"
    t.string   "encoding"
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "flip_pwm"
  end

  create_table "scenarios", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "victory_message"
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "device_id"
    t.string   "name"
    t.string   "notes"
    t.integer  "start_pos"
    t.integer  "end_pos"
    t.string   "colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.integer  "device_id"
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "full_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
