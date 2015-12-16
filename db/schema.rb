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

ActiveRecord::Schema.define(version: 20151215001321) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "pet_id",            limit: 4
    t.integer  "doctor_id",         limit: 4
    t.date     "visit_date"
    t.boolean  "requires_reminder", limit: 1,   default: false
    t.string   "visit_reason",      limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id", using: :btree
  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "address",           limit: 255
    t.string   "city",              limit: 255
    t.string   "state",             limit: 255
    t.string   "zip",               limit: 255
    t.string   "school",            limit: 255
    t.integer  "years_of_practice", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "pet_type",    limit: 255
    t.string   "breed",       limit: 255
    t.integer  "age",         limit: 4
    t.decimal  "weight",                  precision: 10
    t.date     "last_visit"
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "pets", ["customer_id"], name: "index_pets_on_customer_id", using: :btree

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "pets"
  add_foreign_key "pets", "customers"
end
