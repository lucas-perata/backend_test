# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_925_155_437) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'clients', force: :cascade do |t|
    t.string 'client_id', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email'
    t.string 'job'
    t.string 'address'
    t.string 'zip_code'
    t.string 'phone'
  end

  create_table 'footers', force: :cascade do |t|
    t.bigint 'client_id', null: false
    t.string 'reserved'
    t.date 'payment_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_footers_on_client_id'
  end

  create_table 'headers', force: :cascade do |t|
    t.bigint 'client_id', null: false
    t.string 'payment_id'
    t.string 'reserved'
    t.string 'currency'
    t.integer 'discounts'
    t.integer 'total_with_discounts'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'footer_id'
    t.integer 'total'
    t.index ['client_id'], name: 'index_headers_on_client_id'
    t.index ['footer_id'], name: 'index_headers_on_footer_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.bigint 'client_id', null: false
    t.string 'transaction_id', null: false
    t.integer 'amount'
    t.string 'reserved'
    t.integer 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_transactions_on_client_id'
  end

  add_foreign_key 'footers', 'clients'
  add_foreign_key 'headers', 'clients'
  add_foreign_key 'headers', 'footers'
  add_foreign_key 'transactions', 'clients'
end
