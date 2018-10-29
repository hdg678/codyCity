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

ActiveRecord::Schema.define(version: 20181029002714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Courses_Developers", id: false, force: :cascade do |t|
    t.integer "course_id",    null: false
    t.integer "developer_id", null: false
  end

  create_table "Courses_Instructors", id: false, force: :cascade do |t|
    t.integer "course_id",     null: false
    t.integer "instructor_id", null: false
  end

  create_table "Courses_Students", id: false, force: :cascade do |t|
    t.integer "course_id",  null: false
    t.integer "student_id", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "github_username"
    t.string   "github_password"
    t.boolean  "is_teacher"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.integer  "course_id"
    t.integer  "value_for_order"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["course_id"], name: "index_lessons_on_course_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lessons", "courses"
end
