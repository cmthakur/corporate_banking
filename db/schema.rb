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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130203130007) do

  create_table "accounts", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "type",       :null => false
    t.integer  "profile_id"
    t.string   "status"
    t.integer  "balance_id"
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "balances", :force => true do |t|
    t.float    "amount",      :default => 0.0
    t.integer  "member_id"
    t.integer  "account_id"
    t.integer  "interest_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "cash_collections", :force => true do |t|
    t.integer  "account_id",                     :null => false
    t.float    "amount",        :default => 0.0
    t.integer  "member_id",                      :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.date     "received_date"
    t.date     "received_on"
    t.string   "type"
    t.string   "description"
  end

  create_table "interests", :force => true do |t|
    t.string   "type"
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "user_name"
    t.string   "type"
    t.integer  "profile_id"
    t.string   "status",                 :default => "joined"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "profiles", :force => true do |t|
    t.string   "fname",             :null => false
    t.string   "mname"
    t.string   "lname",             :null => false
    t.integer  "age",               :null => false
    t.string   "father_name",       :null => false
    t.date     "dob",               :null => false
    t.string   "district",          :null => false
    t.string   "zone"
    t.integer  "ward_no"
    t.string   "phone",             :null => false
    t.string   "occupation"
    t.string   "verification_id",   :null => false
    t.string   "verification_type"
    t.string   "maritial_status",   :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "account_id"
    t.integer  "member_id"
    t.string   "image"
    t.string   "mcp"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
