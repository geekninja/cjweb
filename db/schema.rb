# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160916175534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categorries", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.integer  "old_id"
    t.string   "old_link"
    t.boolean  "publish",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "category_id"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
    t.text     "bio"
    t.integer  "user_type"
    t.string   "email"
  end

  create_table "juridical_report_articles", force: :cascade do |t|
    t.integer  "juridical_report_id"
    t.integer  "article_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "juridical_report_articles", ["article_id"], name: "index_juridical_report_articles_on_article_id", using: :btree
  add_index "juridical_report_articles", ["juridical_report_id"], name: "index_juridical_report_articles_on_juridical_report_id", using: :btree

  create_table "juridical_reports", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "code"
    t.integer  "situation",   default: 0
    t.boolean  "publish",     default: false
    t.boolean  "special",     default: false
    t.string   "file_path"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "migrate_articles", force: :cascade do |t|
    t.string   "date"
    t.string   "author"
    t.string   "title"
    t.string   "link"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id"
  end

  create_table "question_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "question_options", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "description"
    t.boolean  "correct",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "question_options", ["question_id"], name: "index_question_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "question_category_id"
    t.text     "description"
    t.text     "observation"
    t.text     "origin"
    t.string   "code"
    t.integer  "difficulty",           default: 0
    t.integer  "context",              default: 0
    t.boolean  "publish",              default: true
    t.text     "tags",                 default: [],                array: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "questions", ["question_category_id"], name: "index_questions_on_question_category_id", using: :btree

end
