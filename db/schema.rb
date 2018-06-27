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

ActiveRecord::Schema.define(version: 20180627072442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string "home_type", limit: 50
    t.string "listing_type", limit: 50
    t.text "summary"
    t.integer "zip_code", default: 0
    t.string "state", limit: 50
    t.string "city", limit: 50
    t.string "address", limit: 50
    t.boolean "is_tv", default: false, null: false
    t.boolean "is_kitchen", default: false, null: false
    t.boolean "is_air", default: false, null: false
    t.boolean "is_heating", default: false, null: false
    t.boolean "is_internet", default: false, null: false
    t.integer "accomodate", default: 0
    t.integer "bedroom", default: 0
    t.integer "bathroom", default: 0
    t.integer "sheet", default: 0
    t.integer "price", default: 0
    t.boolean "active", default: false, null: false
    t.bigint "user_id"
    t.string "listing_name", limit: 50
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["listing_id"], name: "index_photos_on_listing_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "listing_id"
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.integer "price", default: 0
    t.integer "total_price", default: 0
    t.string "menu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "self_booking"
    t.index ["listing_id"], name: "index_reservations_on_listing_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.string "image"
    t.string "name"
    t.string "publishable_key"
    t.string "secret_key"
    t.string "stripe_user_id"
    t.string "currency"
    t.string "stripe_account_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "listings", "users"
  add_foreign_key "photos", "listings"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "users"
end
