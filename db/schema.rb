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

ActiveRecord::Schema.define(:version => 20100911152928) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "issue_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commit_notes", :force => true do |t|
    t.text     "note"
    t.integer  "commit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commits", :force => true do |t|
    t.text     "message"
    t.string   "hash_index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", :force => true do |t|
    t.integer  "repository_id"
    t.integer  "user_id"
    t.integer  "status_id"
    t.text     "content"
    t.integer  "closed_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pull_commits", :force => true do |t|
    t.integer  "pull_request_id"
    t.integer  "start_commit_id"
    t.integer  "end_commit_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pull_requests", :force => true do |t|
    t.text     "content"
    t.integer  "source_repository_id"
    t.integer  "target_repository_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "type_id"
    t.integer  "fork_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repository_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "watchings", :force => true do |t|
    t.integer  "repository_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
