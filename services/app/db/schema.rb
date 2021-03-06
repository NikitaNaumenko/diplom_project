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

ActiveRecord::Schema.define(version: 2019_06_10_073952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_moi_krug_secrets", force: :cascade do |t|
    t.string "client_id"
    t.string "client_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_account_moi_krug_secrets_on_account_id"
  end

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

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_departments_on_account_id"
    t.index ["code"], name: "index_departments_on_code"
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

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_positions_on_account_id"
    t.index ["code"], name: "index_positions_on_code"
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

  create_table "user_family_members", force: :cascade do |t|
    t.string "kinship"
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.datetime "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_family_members_on_user_id"
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
    t.string "role"
    t.bigint "position_id"
    t.bigint "department_id"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["position_id"], name: "index_users_on_position_id"
  end

  add_foreign_key "account_moi_krug_secrets", "accounts"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "departments", "accounts"
  add_foreign_key "educations", "accounts"
  add_foreign_key "positions", "accounts"
  add_foreign_key "skills", "accounts"
  add_foreign_key "token_moi_krugs", "accounts"
  add_foreign_key "user_educations", "educations"
  add_foreign_key "user_educations", "users"
  add_foreign_key "user_family_members", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
  add_foreign_key "users", "accounts"
end
