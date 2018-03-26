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

ActiveRecord::Schema.define(version: 20180325021946) do

  create_table "twitts", force: :cascade do |t|
    t.bigint "twitter_id", null: false
    t.string "text", null: false
    t.string "hashtag", null: false
    t.string "lang", null: false
    t.string "url", null: false
    t.bigint "user_id", null: false
    t.string "user_name", null: false
    t.string "profile_image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag"], name: "index_twitts_on_hashtag"
    t.index ["twitter_id"], name: "index_twitts_on_twitter_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
