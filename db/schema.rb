# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_29_213318) do

  create_table "climbers", force: :cascade do |t|
    t.string "name"
    t.string "experience"
    t.integer "birthyear"
    t.text "bio"
    t.string "height"
    t.integer "weight"
    t.string "origin"
    t.string "preference"
    t.text "profile_pic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "rock_type"
    t.text "approach"
    t.string "popularity"
    t.text "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "climber_id"
    t.integer "community_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["climber_id"], name: "index_memberships_on_climber_id"
    t.index ["community_id"], name: "index_memberships_on_community_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "climber_id"
    t.integer "route_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["climber_id"], name: "index_projects_on_climber_id"
    t.index ["route_id"], name: "index_projects_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.string "difficulty"
    t.string "style"
    t.integer "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "picture"
    t.integer "likes", default: 0
    t.index ["location_id"], name: "index_routes_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
