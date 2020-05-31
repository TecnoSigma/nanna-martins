# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_30_054250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string "reference"
    t.string "kind"
    t.string "name"
    t.text "feature"
    t.boolean "new"
    t.text "history"
    t.text "description", default: [], array: true
    t.string "status"
    t.string "size"
    t.text "complement", default: [], array: true
    t.integer "amount"
    t.datetime "deleted_at"
    t.bigint "collection_id"
    t.bigint "gender_id"
    t.bigint "stock_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_accessories_on_collection_id"
    t.index ["gender_id"], name: "index_accessories_on_gender_id"
    t.index ["stock_id"], name: "index_accessories_on_stock_id"
  end

  create_table "accessories_clothings", id: false, force: :cascade do |t|
    t.bigint "accessory_id", null: false
    t.bigint "clothing_id", null: false
    t.index ["accessory_id"], name: "index_accessories_clothings_on_accessory_id"
    t.index ["clothing_id"], name: "index_accessories_clothings_on_clothing_id"
  end

  create_table "accessories_customers", id: false, force: :cascade do |t|
    t.bigint "accessory_id", null: false
    t.bigint "customer_id", null: false
    t.index ["accessory_id"], name: "index_accessories_customers_on_accessory_id"
    t.index ["customer_id"], name: "index_accessories_customers_on_customer_id"
  end

  create_table "clothings", force: :cascade do |t|
    t.string "reference"
    t.string "kind"
    t.string "name"
    t.text "feature"
    t.boolean "new"
    t.text "history"
    t.text "description", default: [], array: true
    t.string "status"
    t.string "size"
    t.text "complement", default: [], array: true
    t.integer "amount"
    t.datetime "deleted_at"
    t.bigint "collection_id"
    t.bigint "gender_id"
    t.bigint "stock_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_clothings_on_collection_id"
    t.index ["gender_id"], name: "index_clothings_on_gender_id"
    t.index ["stock_id"], name: "index_clothings_on_stock_id"
  end

  create_table "clothings_customers", id: false, force: :cascade do |t|
    t.bigint "clothing_id", null: false
    t.bigint "customer_id", null: false
    t.index ["clothing_id"], name: "index_clothings_customers_on_clothing_id"
    t.index ["customer_id"], name: "index_clothings_customers_on_customer_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.string "station"
    t.integer "year"
    t.string "status"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "forename"
    t.string "surname"
    t.string "email"
    t.string "gender"
    t.string "document"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "status"
    t.string "password"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "kind"
  end

  create_table "offer_channels", force: :cascade do |t|
    t.boolean "newsletter", default: true
    t.boolean "sms", default: true
    t.boolean "whatsapp", default: true
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_offer_channels_on_customer_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "minimum"
    t.integer "maximum"
  end

end
