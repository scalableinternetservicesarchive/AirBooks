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

ActiveRecord::Schema.define(version: 20150601104317) do

  create_table "book_reviews", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "rating",     limit: 4,     null: false
    t.text     "review",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "book_reviews", ["book_id"], name: "index_book_reviews_on_book_id", using: :btree
  add_index "book_reviews", ["user_id"], name: "index_book_reviews_on_user_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "author",             limit: 255
    t.string   "isbn",               limit: 255
    t.string   "condition",          limit: 255
    t.text     "comments",           limit: 65535
    t.string   "owner_email",        limit: 255
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.decimal  "price",                            precision: 8, scale: 2
    t.date     "due_date"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "genre",              limit: 255
    t.boolean  "checked_out",        limit: 1,                             default: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.string   "buyer_email",  limit: 255
    t.string   "seller_email", limit: 255
    t.integer  "book_id",      limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "price",                    precision: 8, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "user_balances", force: :cascade do |t|
    t.decimal  "balance",              precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "user_balances", ["user_id"], name: "index_user_balances_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,                           default: "",  null: false
    t.string   "encrypted_password",     limit: 255,                           default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,                             default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.string   "phone",                  limit: 255
    t.string   "location",               limit: 255
    t.decimal  "balance",                              precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "user_balance_id",        limit: 4
    t.string   "occupation",             limit: 255
    t.string   "public_email",           limit: 255
    t.string   "website",                limit: 255
    t.text     "about_me",               limit: 65535
    t.text     "interests",              limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_balance_id"], name: "index_users_on_user_balance_id", using: :btree

  add_foreign_key "book_reviews", "books"
  add_foreign_key "book_reviews", "users"
  add_foreign_key "user_balances", "users"
  add_foreign_key "users", "user_balances"
end
