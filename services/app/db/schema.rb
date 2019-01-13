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

ActiveRecord::Schema.define(version: 2019_01_10_160339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone"
    t.datetime "confirmation_at"
    t.string "confirmation_code"
    t.string "confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email"
    t.index ["name"], name: "index_accounts_on_name"
  end

  create_table "educations", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id", "code"], name: "index_educations_on_account_id_and_code"
    t.index ["account_id"], name: "index_educations_on_account_id"
    t.index ["code"], name: "index_educations_on_code"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["target_type", "target_id", "var"], name: "index_settings_on_target_type_and_target_id_and_var", unique: true
    t.index ["target_type", "target_id"], name: "index_settings_on_target_type_and_target_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id", "code"], name: "index_skills_on_account_id_and_code"
    t.index ["account_id"], name: "index_skills_on_account_id"
    t.index ["code"], name: "index_skills_on_code"
  end

  create_table "token_moi_krugs", force: :cascade do |t|
    t.string "access_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_token_moi_krugs_on_account_id"
  end

  create_table "user_educations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "education_id"
    t.index ["education_id"], name: "index_user_educations_on_education_id"
    t.index ["user_id", "education_id"], name: "index_user_educations_on_user_id_and_education_id"
    t.index ["user_id"], name: "index_user_educations_on_user_id"
  end

  create_table "user_skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "skill_id"
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_id", "skill_id"], name: "index_user_skills_on_user_id_and_skill_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.string "patronymic"
    t.datetime "birthdate"
    t.string "work_state"
    t.string "employee_number"
    t.string "citizenship"
    t.string "birthplace"
    t.string "gender"
    t.string "marital_status"
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "educations", "accounts"
  add_foreign_key "skills", "accounts"
  add_foreign_key "token_moi_krugs", "accounts"
  add_foreign_key "user_educations", "educations"
  add_foreign_key "user_educations", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
  add_foreign_key "users", "accounts"
end
