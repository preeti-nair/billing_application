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

ActiveRecord::Schema.define(version: 20161227045450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_clients", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "client_id",   null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.integer  "contact_no",        limit: 8
    t.string   "email_address"
    t.string   "project_name"
    t.string   "identity_document"
    t.string   "identity_number"
    t.integer  "employee_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "is_active",                   default: false
    t.datetime "expected_schedule"
  end

  add_index "clients", ["employee_id"], name: "index_clients_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer  "emp_id",            limit: 8
    t.string   "name"
    t.integer  "contact_no",        limit: 8
    t.string   "email_address"
    t.string   "identity_document"
    t.string   "identity_number"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "bill_to_name"
    t.string   "bill_to_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "invoice_no"
    t.hstore   "particulars"
    t.hstore   "tax"
    t.integer  "total"
    t.datetime "invoice_date"
    t.string   "break_up_costing"
    t.string   "category"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "category"
    t.integer  "year"
    t.integer  "invoice_identifier"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "invoices", ["event_id"], name: "index_invoices_on_event_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "value",       limit: 8
    t.integer  "category_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rates", ["category_id"], name: "index_rates_on_category_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "duration"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedules", ["client_id"], name: "index_schedules_on_client_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.integer  "employee_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["employee_id"], name: "index_users_on_employee_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "clients", "employees"
  add_foreign_key "invoices", "events"
  add_foreign_key "rates", "categories"
  add_foreign_key "schedules", "clients"
  add_foreign_key "users", "employees"
end
