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

ActiveRecord::Schema.define(version: 20180420112334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collabs", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.string "gender"
    t.date "birth_date"
    t.string "social_security_number"
    t.string "birth_city"
    t.string "nationality"
    t.bigint "firm_id"
    t.bigint "function_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firm_id"], name: "index_collabs_on_firm_id"
    t.index ["function_id"], name: "index_collabs_on_function_id"
  end

  create_table "collective_agreements", force: :cascade do |t|
    t.string "idcc"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.date "hiring_date"
    t.string "mobility_zone"
    t.string "nature"
    t.string "task"
    t.float "week_work_duration"
    t.integer "paid_vacation_days"
    t.integer "initial_trial_period_duration"
    t.boolean "renewal_trial_period", default: true, null: false
    t.string "initial_trial_period_type"
    t.bigint "firm_id"
    t.bigint "collab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collab_id"], name: "index_contracts_on_collab_id"
    t.index ["firm_id"], name: "index_contracts_on_firm_id"
  end

  create_table "firms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "siret"
    t.string "rcs"
    t.string "legal_form"
    t.string "urssaf"
    t.string "urssaf_place"
    t.bigint "collective_agreement_id"
    t.integer "representative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collective_agreement_id"], name: "index_firms_on_collective_agreement_id"
  end

  create_table "functions", force: :cascade do |t|
    t.string "title"
    t.string "level"
    t.string "coefficient"
    t.string "status"
    t.integer "monthly_starting_salary"
    t.integer "annual_starting_salary"
    t.string "bonus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false, null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collabs", "firms"
  add_foreign_key "collabs", "functions"
  add_foreign_key "contracts", "collabs"
  add_foreign_key "contracts", "firms"
  add_foreign_key "firms", "collective_agreements"
end
