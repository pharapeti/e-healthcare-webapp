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

ActiveRecord::Schema.define(version: 2020_05_25_111336) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "answered_by_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answered_by_id"], name: "index_answers_on_answered_by_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "chat_room_id", null: false
    t.integer "user_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_room_id"], name: "index_chat_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.integer "urgent_request_id"
    t.integer "consultation_request_id"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultation_request_id"], name: "index_chat_rooms_on_consultation_request_id"
    t.index ["doctor_id"], name: "index_chat_rooms_on_doctor_id"
    t.index ["patient_id"], name: "index_chat_rooms_on_patient_id"
    t.index ["urgent_request_id"], name: "index_chat_rooms_on_urgent_request_id"
  end

  create_table "consultation_requests", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "directed_to_id", null: false
    t.text "description"
    t.datetime "scheduled_for"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["directed_to_id"], name: "index_consultation_requests_on_directed_to_id"
    t.index ["patient_id"], name: "index_consultation_requests_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "practice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "license_activation_id"
    t.index ["license_activation_id"], name: "index_doctors_on_license_activation_id"
    t.index ["practice_id"], name: "index_doctors_on_practice_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "license_activations", force: :cascade do |t|
    t.text "license_number", null: false
    t.text "code", null: false
    t.boolean "redeemed", default: false, null: false
    t.datetime "redeemed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "practice_id"
    t.index ["license_number"], name: "index_license_activations_on_license_number", unique: true
  end

  create_table "patients", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.text "description"
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "created_by_id", null: false
    t.integer "directed_to_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_by_id"], name: "index_questions_on_created_by_id"
    t.index ["directed_to_id"], name: "index_questions_on_directed_to_id"
  end

  create_table "transcripts", force: :cascade do |t|
    t.integer "chat_room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_room_id"], name: "index_transcripts_on_chat_room_id"
  end

  create_table "urgent_requests", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["patient_id"], name: "index_urgent_requests_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "doctors", column: "answered_by_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "chat_messages", "chat_rooms"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "chat_rooms", "consultation_requests"
  add_foreign_key "chat_rooms", "doctors"
  add_foreign_key "chat_rooms", "patients"
  add_foreign_key "chat_rooms", "urgent_requests"
  add_foreign_key "consultation_requests", "doctors", column: "directed_to_id"
  add_foreign_key "consultation_requests", "patients"
  add_foreign_key "doctors", "practices"
  add_foreign_key "doctors", "users"
  add_foreign_key "patients", "users"
  add_foreign_key "prescriptions", "doctors"
  add_foreign_key "prescriptions", "patients"
  add_foreign_key "questions", "doctors", column: "directed_to_id"
  add_foreign_key "questions", "patients", column: "created_by_id"
  add_foreign_key "transcripts", "chat_rooms"
  add_foreign_key "urgent_requests", "patients"
end
