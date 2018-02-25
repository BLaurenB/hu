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

ActiveRecord::Schema.define(version: 20180225025347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snapshots", force: :cascade do |t|
    t.string "file"
    t.bigint "venture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venture_id"], name: "index_snapshots_on_venture_id"
  end

  create_table "terms", force: :cascade do |t|
    t.bigint "venture_id"
    t.bigint "snapshot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "word"
    t.index ["snapshot_id"], name: "index_terms_on_snapshot_id"
    t.index ["venture_id"], name: "index_terms_on_venture_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ventures", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "notes"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_ventures_on_category_id"
    t.index ["user_id"], name: "index_ventures_on_user_id"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "snapshots", "ventures"
  add_foreign_key "terms", "snapshots"
  add_foreign_key "terms", "ventures"
  add_foreign_key "ventures", "categories"
  add_foreign_key "ventures", "users"
end
