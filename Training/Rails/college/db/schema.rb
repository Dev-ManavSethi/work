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

ActiveRecord::Schema.define(version: 2019_09_10_072243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", id: false, force: :cascade do |t|
    t.text "id"
    t.bigint "departments_id"
    t.bigint "teachers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departments_id"], name: "index_assignments_on_departments_id"
    t.index ["teachers_id"], name: "index_assignments_on_teachers_id"
  end

  create_table "departments", id: false, force: :cascade do |t|
    t.text "id"
    t.text "name", default: "Default name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isAcademic"
    t.text "hod_id"
    t.index ["hod_id"], name: "index_departments_on_hod_id"
  end

  create_table "sections", id: false, force: :cascade do |t|
    t.text "id"
    t.text "departments_id"
    t.text "teachers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departments_id"], name: "index_sections_on_departments_id"
    t.index ["teachers_id"], name: "index_sections_on_teachers_id"
  end

  create_table "sections_teachers", id: false, force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["section_id"], name: "index_sections_teachers_on_section_id"
    t.index ["teacher_id"], name: "index_sections_teachers_on_teacher_id"
  end

  create_table "students", id: false, force: :cascade do |t|
    t.text "id"
    t.text "name"
    t.text "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_students_on_section_id"
  end

  create_table "students_teachers", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["student_id"], name: "index_students_teachers_on_student_id"
    t.index ["teacher_id"], name: "index_students_teachers_on_teacher_id"
  end

  create_table "subjects", id: false, force: :cascade do |t|
    t.text "id"
    t.text "name"
    t.integer "year"
    t.text "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_subjects_on_department_id"
  end

  create_table "subjects_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.index ["subject_id"], name: "index_subjects_teachers_on_subject_id"
    t.index ["teacher_id"], name: "index_subjects_teachers_on_teacher_id"
  end

  create_table "teachers", id: false, force: :cascade do |t|
    t.text "id"
    t.text "name"
    t.date "dob"
    t.integer "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supervisor_id"
    t.index ["supervisor_id"], name: "index_teachers_on_supervisor_id"
  end

end
