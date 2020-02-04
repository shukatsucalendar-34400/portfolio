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

ActiveRecord::Schema.define(version: 20200201134842) do

  create_table "businesses", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "web_site"
    t.string "my_page"
    t.string "address"
    t.text "details"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "business_id"
    t.integer "status", default: 2
    t.datetime "first_date"
    t.datetime "last_date"
    t.boolean "all_day", default: true
    t.boolean "deadline", default: false
    t.datetime "deadline_date"
    t.boolean "deadline_all_day", default: true
    t.boolean "selection", default: false
    t.datetime "selection_date"
    t.boolean "selection_all_day", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_schedules_on_business_id"
    t.index ["user_id", "first_date", "last_date"], name: "index_schedules_on_user_id_and_first_date_and_last_date"
    t.index ["user_id", "status", "deadline_date"], name: "index_schedules_on_user_id_and_status_and_deadline_date"
    t.index ["user_id", "status", "selection_date"], name: "index_schedules_on_user_id_and_status_and_selection_date"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "generate"
    t.string "model"
    t.string "User"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

end
