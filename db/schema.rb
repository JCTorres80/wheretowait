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

ActiveRecord::Schema.define(:version => 20140911133801) do

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.decimal  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flagged_words", :force => true do |t|
    t.string   "word"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flagged_words", ["word"], :name => "index_flagged_words_on_word"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.date     "open_date"
    t.string   "website"
    t.string   "location_type"
    t.text     "search_string"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "locations", ["address"], :name => "index_locations_on_address"
  add_index "locations", ["city"], :name => "index_locations_on_city"
  add_index "locations", ["name"], :name => "index_locations_on_name"
  add_index "locations", ["search_string"], :name => "index_locations_on_search_string"
  add_index "locations", ["state"], :name => "index_locations_on_state"
  add_index "locations", ["website"], :name => "index_locations_on_website"
  add_index "locations", ["zip_code"], :name => "index_locations_on_zip_code"

  create_table "question_answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "question_answers", ["answer_id"], :name => "index_question_answers_on_answer_id"
  add_index "question_answers", ["question_id"], :name => "index_question_answers_on_question_id"

  create_table "questionnaires", :force => true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.text     "comment"
    t.boolean  "flagged",     :default => false
    t.boolean  "moderated",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "questionnaires", ["location_id"], :name => "index_questionnaires_on_location_id"
  add_index "questionnaires", ["user_id"], :name => "index_questionnaires_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.string   "answer_type"
    t.string   "group"
    t.string   "unit",           :default => ""
    t.string   "sub_group"
    t.string   "sub_group_unit", :default => ""
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "user_answers", :force => true do |t|
    t.integer  "question_id"
    t.decimal  "value"
    t.integer  "questionnaire_id"
    t.integer  "location_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "user_answers", ["location_id"], :name => "index_user_answers_on_location_id"
  add_index "user_answers", ["question_id"], :name => "index_user_answers_on_question_id"
  add_index "user_answers", ["questionnaire_id"], :name => "index_user_answers_on_questionnaire_id"

  create_table "users", :force => true do |t|
    t.string   "email",                         :default => "",     :null => false
    t.string   "encrypted_password",            :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 :default => 0,      :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.date     "birthday"
    t.string   "gender"
    t.string   "timezone",                      :default => "UTC"
    t.string   "role",                          :default => "user", :null => false
    t.datetime "terms_of_service_confirmed_at"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
