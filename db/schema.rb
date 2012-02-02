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

ActiveRecord::Schema.define(:version => 20120202052843) do

  create_table "books", :force => true do |t|
    t.integer  "poster_id"
    t.text     "title"
    t.text     "description"
    t.text     "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "genre_id"
    t.text     "postername"
    t.string   "postermail"
  end

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "commenter"
    t.text     "commentable_name"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "contacts", :force => true do |t|
    t.text    "subject"
    t.text    "contactor"
    t.integer "contactor_id"
    t.text    "body"
  end

  create_table "genres", :force => true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "text"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "plan"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "book_id"
    t.text     "receiver"
    t.string   "to_email"
    t.text     "sender"
  end

  create_table "regions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.integer  "res_id"
  end

  create_table "reponse_forms", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_forms", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests_pages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "response_pages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.text     "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "location"
    t.text     "personal"
    t.text     "goodtime"
    t.text     "region_id"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.string   "avatar_file_name"
    t.datetime "avatar_updated_at"
  end

end
