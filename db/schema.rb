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

ActiveRecord::Schema.define(version: 20170208052754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "picture"
    t.index ["user_id"], name: "index_circuses_on_user_id", using: :btree
  end

  create_table "circuses_fleas", force: :cascade do |t|
    t.integer  "circus_id"
    t.integer  "flea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circus_id"], name: "index_circuses_fleas_on_circus_id", using: :btree
    t.index ["flea_id"], name: "index_circuses_fleas_on_flea_id", using: :btree
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fleas", force: :cascade do |t|
    t.string   "skill"
    t.integer  "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_fleas_on_dog_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "family_name"
    t.boolean  "is_admin"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.string   "votable_type"
    t.integer  "votable_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id", using: :btree
  end

  add_foreign_key "circuses", "users"
  add_foreign_key "circuses_fleas", "circuses"
  add_foreign_key "circuses_fleas", "fleas"
  add_foreign_key "fleas", "dogs"
  add_foreign_key "votes", "users"
end
