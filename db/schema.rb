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

ActiveRecord::Schema[8.0].define(version: 2025_05_02_123719) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "storage"
    t.string "color"
    t.string "price"
    t.string "serial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "phone_id", null: false
    t.integer "brand_id", null: false
    t.integer "type_id"
    t.integer "category_id"
    t.index ["brand_id"], name: "index_devices_on_brand_id"
    t.index ["category_id"], name: "index_devices_on_category_id"
    t.index ["phone_id"], name: "index_devices_on_phone_id"
    t.index ["type_id"], name: "index_devices_on_type_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.integer "device_id", null: false
    t.integer "discounted_percentage"
    t.decimal "discounted_price"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_discounts_on_device_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "external_id", null: false
    t.integer "brand_id", null: false
    t.string "name"
    t.string "brand_name"
    t.string "battery_type"
    t.text "battery_charging"
    t.string "platform_os"
    t.string "platform_chipset"
    t.string "platform_cpu"
    t.string "platform_gpu"
    t.string "network_technology"
    t.string "network_speed"
    t.text "network_2g"
    t.text "network_3g"
    t.text "network_4g"
    t.text "network_5g"
    t.string "display_type"
    t.string "display_size"
    t.string "display_resolution"
    t.string "display_protection"
    t.date "launch_announced"
    t.date "launch_released"
    t.string "launch_status"
    t.string "body_dimensions"
    t.string "body_weight"
    t.string "body_build"
    t.string "body_sim"
    t.string "memory_card_slot"
    t.string "memory_internal"
    t.string "sound_audio_jack"
    t.string "sound_loudspeaker"
    t.string "comms_wlan"
    t.string "comms_bluetooth"
    t.string "comms_positioning"
    t.boolean "comms_nfc"
    t.string "comms_radio"
    t.string "comms_usb"
    t.string "features_sensors"
    t.text "colors"
    t.text "models"
    t.string "cameras_main_type"
    t.text "cameras_main_camera_specs"
    t.text "cameras_main_features"
    t.text "cameras_main_video"
    t.string "cameras_selfie_type"
    t.text "cameras_selfie_camera_specs"
    t.text "cameras_selfie_features"
    t.text "cameras_selfie_video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_phones_on_brand_id"
    t.index ["external_id"], name: "index_phones_on_external_id", unique: true
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "device_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "devices", "brands"
  add_foreign_key "devices", "categories"
  add_foreign_key "devices", "phones"
  add_foreign_key "devices", "types"
  add_foreign_key "discounts", "devices"
  add_foreign_key "phones", "brands"
end
