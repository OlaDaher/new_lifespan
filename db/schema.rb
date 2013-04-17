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

ActiveRecord::Schema.define(:version => 20130417120344) do

  create_table "donor_abilities", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "donors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "region",                        :default => ""
    t.string   "blood_type",                    :default => ""
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "photo"
    t.boolean  "admin",                         :default => false
    t.string   "auth_token"
    t.date     "date_of_birth"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "confirmation_code"
    t.boolean  "authenticated"
    t.string   "password_resets_donor_token"
    t.datetime "password_resets_donor_sent_at"
  end

  create_table "medic_abilities", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medics", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.integer  "organization_id",        :default => 0
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "phone"
    t.boolean  "admin",                  :default => false
    t.string   "auth_token"
    t.date     "date_of_birth"
    t.string   "photo"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "region",     :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "phone"
    t.string   "photo"
    t.string   "website"
    t.string   "email"
  end

  create_table "requests", :force => true do |t|
    t.string   "content"
    t.time     "posted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
