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

ActiveRecord::Schema.define(version: 2022_02_24_041539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "costs", force: :cascade do |t|
    t.string "type"
    t.float "quantity"
    t.string "description"
    t.string "periodicity"
    t.float "price"
    t.string "name"
    t.string "measurement_unit"
    t.bigint "craft_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["craft_id"], name: "index_costs_on_craft_id"
  end

  create_table "crafts", force: :cascade do |t|
    t.string "type"
    t.string "description"
    t.integer "quantity"
    t.string "season"
    t.string "year"
    t.string "exclusivity"
    t.float "worked_hours"
    t.float "weight"
    t.string "reference"
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_crafts_on_order_id"
  end

  create_table "crafts_inspirations", id: false, force: :cascade do |t|
    t.bigint "craft_id", null: false
    t.bigint "inspiration_id", null: false
    t.index ["craft_id"], name: "index_crafts_inspirations_on_craft_id"
    t.index ["inspiration_id"], name: "index_crafts_inspirations_on_inspiration_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "document"
    t.string "site"
    t.string "email"
    t.string "contact"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "telephone"
    t.string "cellphone"
    t.integer "status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedstocks", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "measurement_unit"
    t.integer "quantity"
    t.string "description"
    t.integer "status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedstocks_providers", id: false, force: :cascade do |t|
    t.bigint "feedstock_id", null: false
    t.bigint "provider_id", null: false
    t.index ["feedstock_id"], name: "index_feedstocks_providers_on_feedstock_id"
    t.index ["provider_id"], name: "index_feedstocks_providers_on_provider_id"
  end

  create_table "inspirations", force: :cascade do |t|
    t.string "type"
    t.string "url"
    t.string "segment"
    t.integer "status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "delivery_forecast"
    t.float "freight"
    t.float "final_payment"
    t.float "down_payment"
    t.integer "quantity"
    t.string "observation"
    t.integer "status", default: 0
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "document"
    t.string "site"
    t.string "email"
    t.string "contact"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "telephone"
    t.integer "status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
