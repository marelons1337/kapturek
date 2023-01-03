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

ActiveRecord::Schema[7.0].define(version: 2023_01_03_060927) do
  create_table "customer_clients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.string "email"
    t.date "rent_from"
    t.date "rent_to"
    t.float "paid"
    t.float "debt"
    t.boolean "company", default: false
    t.text "note"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["account_id"], name: "index_customer_clients_on_account_id"
  end

  create_table "property_expenses", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "amount"
    t.string "description"
    t.date "received_date"
    t.date "due_date"
    t.integer "expensable_id"
    t.string "expensable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_properties", force: :cascade do |t|
    t.string "name"
    t.float "surface"
    t.integer "rooms_amount"
    t.string "door_no"
    t.string "country"
    t.string "city"
    t.string "street"
    t.string "street_no"
    t.string "floor_no"
    t.float "buy_price"
    t.float "sale_price"
    t.date "bought_at"
    t.date "sold_at"
    t.text "description"
    t.integer "status", default: 0
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_rentals", force: :cascade do |t|
    t.string "name"
    t.float "rent"
    t.date "taken_from"
    t.date "taken_until"
    t.text "description"
    t.integer "status", default: 0
    t.integer "property_id"
    t.integer "client_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_property_rentals_on_account_id"
    t.index ["client_id"], name: "index_property_rentals_on_client_id"
    t.index ["property_id"], name: "index_property_rentals_on_property_id"
  end

  create_table "property_sales", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "bought_at"
    t.date "sold_at"
    t.float "buy_price"
    t.float "sale_price"
    t.integer "status", default: 0
    t.integer "property_id"
    t.integer "client_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_property_sales_on_account_id"
    t.index ["client_id"], name: "index_property_sales_on_client_id"
    t.index ["property_id"], name: "index_property_sales_on_property_id"
  end

end
