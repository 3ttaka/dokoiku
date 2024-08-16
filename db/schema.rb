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

ActiveRecord::Schema[7.0].define(version: 2024_08_15_043325) do
  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "reviews", charset: "utf8", force: :cascade do |t|
    t.integer "cleanliness", default: 0, null: false
    t.integer "space", default: 0, null: false
    t.integer "lighting", default: 0, null: false
    t.integer "music", default: 0, null: false
    t.integer "vibrancy", default: 0, null: false
    t.integer "order_speed", default: 0, null: false
    t.integer "service_style", default: 0, null: false
    t.integer "conversation", default: 0, null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shops", charset: "utf8", force: :cascade do |t|
    t.string "shop_name", null: false
    t.string "cuisine_type"
    t.string "closed_days", null: false
    t.string "opening_hours", null: false
    t.string "address", null: false
    t.string "phone_number"
    t.text "additional_info"
    t.string "wifi"
    t.string "smoking"
    t.string "payment_methods", default: "", null: false
    t.string "price_range", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 17, scale: 14
    t.decimal "longitude", precision: 17, scale: 14
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "reviews", "shops"
  add_foreign_key "reviews", "users"
  add_foreign_key "shops", "users"
end
