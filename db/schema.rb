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

ActiveRecord::Schema.define(version: 20171107055108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "menus_appeared"
    t.integer "times_appeared"
    t.integer "first_appeared"
    t.integer "last_appeared"
    t.decimal "lowest_price", precision: 32, scale: 16
    t.decimal "highest_price", precision: 32, scale: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer "menu_page_id"
    t.integer "dish_id"
    t.decimal "price", precision: 32, scale: 16
    t.decimal "high_price", precision: 32, scale: 16
    t.decimal "xpos", precision: 32, scale: 16
    t.decimal "ypos", precision: 32, scale: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_menu_items_on_dish_id"
    t.index ["menu_page_id"], name: "index_menu_items_on_menu_page_id"
  end

  create_table "menu_pages", force: :cascade do |t|
    t.integer "menu_id"
    t.integer "page_number"
    t.bigint "image_id"
    t.integer "full_height"
    t.integer "full_width"
    t.uuid "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_pages_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "sponsor"
    t.string "event"
    t.string "venue"
    t.string "place"
    t.string "physical_description"
    t.string "occasion"
    t.string "notes"
    t.string "call_number"
    t.string "keywords"
    t.string "language"
    t.string "actual_date"
    t.string "location"
    t.string "location_type"
    t.string "currency"
    t.string "currency_symbol"
    t.string "status"
    t.integer "page_count"
    t.integer "dish_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
