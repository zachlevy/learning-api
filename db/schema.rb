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

ActiveRecord::Schema.define(version: 20170928152828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anonymous_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenge_responses", force: :cascade do |t|
    t.jsonb "input", default: {}
    t.datetime "asked_at"
    t.datetime "completed_at"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "course_id"
    t.bigint "anonymous_user_id"
    t.index ["anonymous_user_id"], name: "index_challenge_responses_on_anonymous_user_id"
    t.index ["challenge_id"], name: "index_challenge_responses_on_challenge_id"
    t.index ["course_id"], name: "index_challenge_responses_on_course_id"
    t.index ["user_id"], name: "index_challenge_responses_on_user_id"
  end

  create_table "challenge_types", force: :cascade do |t|
    t.string "name"
    t.jsonb "template_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "description"
    t.bigint "challenge_type_id"
    t.jsonb "body", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "dependencies", default: []
    t.jsonb "tags", default: []
    t.index ["challenge_type_id"], name: "index_challenges_on_challenge_type_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "embed_url"
    t.integer "est_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "flow", default: [], null: false
    t.jsonb "tags", default: []
    t.string "image_url"
    t.integer "est_duration"
    t.jsonb "ui", default: {}
  end

  create_table "definitions", force: :cascade do |t|
    t.jsonb "body", default: {}
    t.string "word"
    t.jsonb "definitions", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.jsonb "relations", default: {}
    t.jsonb "context", default: {}
    t.jsonb "meta", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.jsonb "body", default: {}
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.jsonb "demographic", default: {}
    t.jsonb "preferences", default: {}
    t.jsonb "details", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "anonymous_user_id"
    t.index ["anonymous_user_id"], name: "index_profiles_on_anonymous_user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "challenge_responses", "anonymous_users"
  add_foreign_key "challenge_responses", "challenges"
  add_foreign_key "challenge_responses", "courses"
  add_foreign_key "challenge_responses", "users"
  add_foreign_key "challenges", "challenge_types"
  add_foreign_key "profiles", "anonymous_users"
  add_foreign_key "profiles", "users"
end
