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

ActiveRecord::Schema.define(version: 20160909132207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "github_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nickname"
    t.string   "email"
    t.string   "name"
    t.string   "image"
    t.string   "location"
    t.integer  "public_repo"
    t.integer  "public_gists"
    t.integer  "followers"
    t.integer  "following"
    t.string   "member_since"
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
