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

ActiveRecord::Schema.define(version: 2022_02_20_214600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crafts", force: :cascade do |t|
    t.string "segment"
    t.string "kind"
    t.integer "quantity"
    t.string "season"
    t.string "year"
    t.string "exclusivity"
    t.float "worked_hours"
    t.float "weight"
    t.string "reference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "crafts_feedstocks", id: false, force: :cascade do |t|
    t.bigint "craft_id", null: false
    t.bigint "feedstock_id", null: false
    t.index ["craft_id"], name: "index_crafts_feedstocks_on_craft_id"
    t.index ["feedstock_id"], name: "index_crafts_feedstocks_on_feedstock_id"
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
