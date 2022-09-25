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

ActiveRecord::Schema[7.0].define(version: 2022_09_25_015630) do
  create_table "clients", force: :cascade do |t|
    t.string "client_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headers", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "payment_id"
    t.string "reserved"
    t.integer "currency"
    t.integer "total"
    t.integer "discounts"
    t.integer "total_with_discounts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_headers_on_client_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "transaction_id", null: false
    t.integer "amount"
    t.string "reserved"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_transactions_on_client_id"
  end

  add_foreign_key "headers", "clients"
  add_foreign_key "transactions", "clients"
end