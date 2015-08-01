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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150523042808) do
=======
ActiveRecord::Schema.define(version: 20150519062506) do
>>>>>>> 38396a90dc3d58d5a9776e8678d948406393b43a

  create_table "admins", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
<<<<<<< HEAD
  end

=======
    t.string   "remember_token",  limit: 255
  end

  add_index "admins", ["remember_token"], name: "index_admins_on_remember_token", using: :btree

>>>>>>> 38396a90dc3d58d5a9776e8678d948406393b43a
  create_table "comments", force: :cascade do |t|
    t.string   "author",     limit: 255
    t.string   "body",       limit: 255
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "comments", "posts"
end