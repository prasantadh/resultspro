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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130802225649) do

  create_table "exams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "marks", :force => true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.integer  "exam_id"
    t.integer  "th_mark"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "standard_id"
    t.integer  "pr_mark"
  end

  create_table "standards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "current",    :default => true
  end

  create_table "students", :force => true do |t|
    t.integer  "roll"
    t.string   "name"
    t.integer  "standard_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "subject_combination_id"
    t.boolean  "current",                :default => true
  end

  create_table "subject_combination_details", :force => true do |t|
    t.integer  "standard_id"
    t.integer  "subject_combination_id"
    t.integer  "subject_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "subject_combinations", :force => true do |t|
    t.string   "name"
    t.integer  "standard_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "standard_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "full_mark"
    t.integer  "pass_mark"
    t.boolean  "practical",           :default => false
    t.integer  "practical_full_mark"
    t.integer  "practical_pass_mark"
    t.boolean  "current",             :default => true
  end

end
