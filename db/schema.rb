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

ActiveRecord::Schema[7.0].define(version: 2024_08_08_025919) do
  create_table "shops", charset: "utf8", force: :cascade do |t|
    t.string "shop_name", null: false
    t.string "cuisine_type"
    t.string "closed_days", null: false
    t.string "opening_hours", null: false
    t.string "address", null: false
    t.string "phone_number"
    t.text "additional_info"
    t.integer "wifi"
    t.integer "smoking"
    t.string "payment_methods", default: "", null: false
    t.float "cleanliness_average", default: 0.0, null: false
    t.float "space_average", default: 0.0, null: false
    t.float "lighting_average", default: 0.0, null: false
    t.float "music_average", default: 0.0, null: false
    t.float "vibrancy_average", default: 0.0, null: false
    t.float "order_speed_average", default: 0.0, null: false
    t.float "service_style_average", default: 0.0, null: false
    t.float "conversation_average", default: 0.0, null: false
    t.float "modal_price_range"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "gender_id", null: false
    t.integer "age_group_id", null: false
    t.text "profile"
    t.integer "my_cleanliness", default: 0, null: false
    t.integer "my_space", default: 0, null: false
    t.integer "my_lighting", default: 0, null: false
    t.integer "my_music", default: 0, null: false
    t.integer "my_vibrancy", default: 0, null: false
    t.integer "my_order_speed", default: 0, null: false
    t.integer "my_service_style", default: 0, null: false
    t.integer "my_conversation", default: 0, null: false
    t.integer "my_price_range"
    t.integer "my_wifi"
    t.integer "my_smoking"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "shops", "users"
end
