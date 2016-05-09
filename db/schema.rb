# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160509151846) do

  create_table "benefits", force: :cascade do |t|
    t.float    "monetaryamt"
    t.integer  "percent"
    t.integer  "covcat_id"
    t.integer  "insplan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", force: :cascade do |t|
    t.date     "date"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bill_note"
  end

  create_table "covcats", force: :cascade do |t|
    t.integer  "defaultpercent"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fees", force: :cascade do |t|
    t.integer  "feeschedule_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "procedure_id"
  end

  create_table "feeschedules", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insplans", force: :cascade do |t|
    t.float    "annualmax"
    t.float    "deductible"
    t.string   "groupname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: :cascade do |t|
    t.float    "deductible_limit"
    t.string   "phone_number"
    t.string   "address"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "benefit_max"
  end

  create_table "procedures", force: :cascade do |t|
    t.string   "description"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "long_description"
    t.integer  "covcat_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "plaque"
    t.integer  "gum"
    t.integer  "tooth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "procedure_id"
    t.integer  "bill_id"
    t.float    "deductible_payment"
    t.float    "insurance_payment"
    t.float    "patient_payment"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "location"
    t.integer  "patient_id"
  end

end
