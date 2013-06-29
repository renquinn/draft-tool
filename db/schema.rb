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

ActiveRecord::Schema.define(:version => 20130629232940) do

  create_table "players", :force => true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "nfl_team"
    t.string   "position"
    t.integer  "completions"
    t.integer  "attempts"
    t.integer  "passing_yards"
    t.integer  "passing_touchdowns"
    t.integer  "interceptions"
    t.integer  "rushes"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "rank"
    t.boolean  "selected",             :default => false
    t.boolean  "removed",              :default => false
    t.boolean  "marked",               :default => false
  end

  create_table "team_settings", :force => true do |t|
    t.integer  "team_id"
    t.float    "completions"
    t.float    "attempts"
    t.float    "passing_yards"
    t.float    "passing_touchdowns"
    t.float    "interceptions"
    t.float    "rushes"
    t.float    "rushing_yards"
    t.float    "rushing_touchdowns"
    t.float    "receptions"
    t.float    "receiving_yards"
    t.float    "receiving_touchdowns"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "team_settings", ["team_id"], :name => "index_team_settings_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["user_id"], :name => "index_teams_on_user_id"

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
    t.boolean  "admin"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
