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

ActiveRecord::Schema.define(version: 20181113022616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_admins_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.integer  "developer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["developer_id"], name: "index_courses_on_developer_id", using: :btree
    t.index ["organization_id"], name: "index_courses_on_organization_id", using: :btree
  end

  create_table "developers", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_developers_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_developers_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_developers_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_developers_on_unlock_token", unique: true, using: :btree
  end

  create_table "exercises", force: :cascade do |t|
    t.integer  "lesson_id"
    t.string   "title"
    t.text     "instructions"
    t.string   "point_value"
    t.string   "test_file_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["lesson_id"], name: "index_exercises_on_lesson_id", using: :btree
  end

  create_table "instructors", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_instructors_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_instructors_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_instructors_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_instructors_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_instructors_on_unlock_token", unique: true, using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "viewable_type"
    t.integer  "viewable_id"
    t.string   "name"
    t.string   "github_username"
    t.string   "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["viewable_type", "viewable_id"], name: "index_profiles_on_viewable_type_and_viewable_id", using: :btree
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id", using: :btree
    t.index ["student_id"], name: "index_student_courses_on_student_id", using: :btree
  end

  create_table "student_exercises", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "student_id"
    t.integer  "point_value"
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["exercise_id"], name: "index_student_exercises_on_exercise_id", using: :btree
    t.index ["instructor_id"], name: "index_student_exercises_on_instructor_id", using: :btree
    t.index ["student_id"], name: "index_student_exercises_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_students_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_students_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_students_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "admins", "organizations"
  add_foreign_key "courses", "developers"
  add_foreign_key "courses", "organizations"
  add_foreign_key "developers", "organizations"
  add_foreign_key "exercises", "lessons"
  add_foreign_key "instructors", "organizations"
  add_foreign_key "lessons", "courses"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
  add_foreign_key "student_exercises", "exercises"
  add_foreign_key "student_exercises", "instructors"
  add_foreign_key "student_exercises", "students"
  add_foreign_key "students", "organizations"
end
