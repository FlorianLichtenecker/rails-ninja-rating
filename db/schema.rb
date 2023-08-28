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

ActiveRecord::Schema[7.0].define(version: 2023_08_28_154914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_items", force: :cascade do |t|
    t.string "content"
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_action_items_on_report_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_reviews", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_reviews_on_report_id"
    t.index ["review_id"], name: "index_report_reviews_on_review_id"
  end

  create_table "reports", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "review_platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_platform_id"], name: "index_reports_on_review_platform_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "review_categories", force: :cascade do |t|
    t.boolean "is_primary"
    t.bigint "review_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_review_categories_on_category_id"
    t.index ["review_id"], name: "index_review_categories_on_review_id"
  end

  create_table "review_platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "status"
    t.date "date"
    t.string "content"
    t.integer "rating"
    t.bigint "review_platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_platform_id"], name: "index_reviews_on_review_platform_id"
  end

  create_table "user_review_platforms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "review_platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_platform_id"], name: "index_user_review_platforms_on_review_platform_id"
    t.index ["user_id"], name: "index_user_review_platforms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "action_items", "reports"
  add_foreign_key "report_reviews", "reports"
  add_foreign_key "report_reviews", "reviews"
  add_foreign_key "reports", "review_platforms"
  add_foreign_key "reports", "users"
  add_foreign_key "review_categories", "categories"
  add_foreign_key "review_categories", "reviews"
  add_foreign_key "reviews", "review_platforms"
  add_foreign_key "user_review_platforms", "review_platforms"
  add_foreign_key "user_review_platforms", "users"
end
