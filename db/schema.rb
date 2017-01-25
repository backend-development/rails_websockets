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

ActiveRecord::Schema.define(version: 20170124205403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_adventures_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.string  "status"
    t.integer "sortorder"
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stepstone_id"
    t.integer  "status_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["status_id"], name: "index_steps_on_status_id", using: :btree
    t.index ["stepstone_id"], name: "index_steps_on_stepstone_id", using: :btree
    t.index ["user_id", "stepstone_id"], name: "index_steps_on_user_id_and_stepstone_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_steps_on_user_id", using: :btree
  end

  create_table "stepstones", force: :cascade do |t|
    t.integer  "adventure_id"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "sortorder"
    t.index ["adventure_id"], name: "index_stepstones_on_adventure_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "fhs_username"
    t.string   "full_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "adventures", "users"
  add_foreign_key "steps", "statuses"
  add_foreign_key "steps", "stepstones"
  add_foreign_key "steps", "users"
  add_foreign_key "stepstones", "adventures"
end
