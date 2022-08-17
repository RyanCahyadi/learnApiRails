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

ActiveRecord::Schema[7.0].define(version: 2022_08_16_162713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "master_brands", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_active"
    t.string "initial"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_locations", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_products", force: :cascade do |t|
    t.string "name"
    t.string "item_code"
    t.string "description"
    t.boolean "is_active"
    t.integer "ms_brand_id"
    t.integer "primary_unit"
    t.string "location_ids"
    t.float "price"
    t.string "image"
    t.date "expired_date"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_ids"], name: "index_master_products_on_location_ids"
    t.index ["ms_brand_id"], name: "index_master_products_on_ms_brand_id"
    t.index ["primary_unit"], name: "index_master_products_on_primary_unit"
  end

  create_table "master_units", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "master_products", "master_brands", column: "ms_brand_id"
  add_foreign_key "master_products", "master_units", column: "primary_unit"
end
