# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_03_232045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address", null: false
    t.integer "flats_amount", null: false
    t.integer "floors", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tenants_count"
  end

  create_table "flats", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.integer "floor_no", null: false
    t.float "surface", null: false
    t.integer "rooms_amount"
    t.integer "door_number", null: false
    t.float "rent", null: false
    t.boolean "taken", default: false
    t.date "taken_until"
    t.float "debt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_flats_on_building_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.bigint "flat_id", null: false
    t.bigint "building_id", null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.integer "phone", null: false
    t.string "email"
    t.integer "account_no"
    t.date "rent_from", null: false
    t.date "rent_to"
    t.date "payment_due"
    t.boolean "paid", default: false
    t.float "debt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_tenants_on_building_id"
    t.index ["flat_id"], name: "index_tenants_on_flat_id"
  end

  add_foreign_key "flats", "buildings"
  add_foreign_key "tenants", "buildings"
  add_foreign_key "tenants", "flats"
end
