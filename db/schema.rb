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

ActiveRecord::Schema.define(:version => 20140827130307) do

  create_table "subscribers", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "trapping_code"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "subscribers", ["email"], :name => "index_subscribers_on_email", :unique => true
  add_index "subscribers", ["trapping_code"], :name => "index_subscribers_on_trapping_code", :unique => true

  create_table "trapped_requests", :force => true do |t|
    t.datetime "request_date"
    t.string   "request_method"
    t.string   "remote_ip"
    t.string   "scheme"
    t.string   "query_string"
    t.text     "query_params"
    t.string   "cookies"
    t.text     "headers"
    t.text     "raw_response"
    t.integer  "subscriber_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
