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

ActiveRecord::Schema.define(version: 2020_05_14_160204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: :cascade do |t|
    t.string "matching_number"
    t.string "full_name"
    t.text "action"
    t.date "date_of_session"
    t.time "start_time"
    t.time "end_time"
    t.string "understand_concepts"
    t.boolean "observe_code_of_conduct"
    t.string "eleborate"
    t.text "topics_covered"
    t.boolean "comfortable_with_tutor"
    t.text "other_feedbacks"
    t.json "know_about_program", default: {}, null: false
    t.string "platform"
    t.text "difficulties_with_tutoring"
    t.bigint "student_id", null: false
    t.bigint "tutor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "step"
    t.string "identity"
    t.index ["student_id"], name: "index_feedbacks_on_student_id"
    t.index ["tutor_id"], name: "index_feedbacks_on_tutor_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "tutor_id", null: false
    t.string "existing_matching_id"
    t.string "imported_data"
    t.index ["student_id"], name: "index_matches_on_student_id"
    t.index ["tutor_id"], name: "index_matches_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
    t.boolean "personal_consent"
    t.string "full_name"
    t.string "school_email"
    t.string "alternate_email"
    t.integer "sex"
    t.json "subject_preferences", default: {}, null: false
    t.integer "education_level"
    t.boolean "parental_consent"
    t.integer "match_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subject_1"
    t.string "subject_2"
    t.string "subject_3"
    t.string "others_subject"
    t.string "existing_educational_level_data"
    t.string "contact_number"
    t.string "imported_data"
    t.boolean "matched"
    t.boolean "sent_intro_email"
  end

  create_table "tutors", force: :cascade do |t|
    t.boolean "personal_consent"
    t.string "full_name"
    t.string "school_email"
    t.string "alternate_email"
    t.integer "sex"
    t.json "subjects", default: {}, null: false
    t.integer "hours_to_teach"
    t.integer "match_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "qualification"
    t.text "past_experiences"
    t.text "reason_for_volunteering"
    t.string "level_to_teach"
    t.boolean "code_of_conduct"
    t.string "contact_number"
    t.string "imported_data"
    t.boolean "matched"
    t.boolean "sent_intro_email"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "feedbacks", "students"
  add_foreign_key "feedbacks", "tutors"
  add_foreign_key "matches", "students"
  add_foreign_key "matches", "tutors"
end
