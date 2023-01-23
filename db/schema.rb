# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_21_224636) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer_text"
    t.integer "answer_value"
    t.bigint "question_id", null: false
    t.bigint "response_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["response_id"], name: "index_answers_on_response_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "caption"
    t.bigint "test_id", null: false
    t.integer "question_type", default: 0
    t.integer "question_order", default: 0
    t.string "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "responder_id", null: false
    t.bigint "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responder_id"], name: "index_responses_on_responder_id"
    t.index ["test_id"], name: "index_responses_on_test_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "response_id", null: false
    t.integer "score", null: false
    t.integer "max_possible_score", null: false
    t.integer "question_count", null: false
    t.integer "answer_count", null: false
    t.string "result", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_results_on_response_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.bigint "author_id", null: false
    t.integer "audience", default: 0
    t.integer "status", default: 0
    t.string "calculation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_tests_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role", default: 0
    t.string "password_digest"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "responses"
  add_foreign_key "questions", "tests"
  add_foreign_key "responses", "tests"
  add_foreign_key "responses", "users", column: "responder_id"
  add_foreign_key "results", "responses"
  add_foreign_key "tests", "users", column: "author_id"
end
