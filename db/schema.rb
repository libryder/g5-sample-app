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

ActiveRecord::Schema.define(:version => 20120324233657) do

  create_table "tours", :force => true do |t|
    t.string   "user_id"
    t.date     "tour_date"
    t.string   "additional_questions"
    t.integer  "rating"
    t.string   "amenities"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ip"
    t.boolean  "pending_activation", :default => true
    t.string   "phone_number"
    t.string   "activation_token"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

end
