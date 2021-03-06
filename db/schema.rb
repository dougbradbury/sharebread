# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090802124256) do

  create_table "drives", :force => true do |t|
    t.string   "name"
    t.datetime "sign_up_by"
    t.datetime "collect_by"
    t.text     "info"
    t.text     "collection_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organizer_id"
    t.boolean  "template"
  end

  create_table "items", :force => true do |t|
    t.string   "description"
    t.integer  "needed",      :default => 0
    t.integer  "collected",   :default => 0
    t.integer  "commited",    :default => 0
    t.integer  "drive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
