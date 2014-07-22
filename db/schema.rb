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

ActiveRecord::Schema.define(version: 20140722201334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currentunits", force: true do |t|
    t.string   "property"
    t.string   "unit_number"
    t.string   "unit_type"
    t.string   "square_feet"
    t.string   "rent"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspection_images", force: true do |t|
    t.integer  "inspection_id"
    t.string   "inspection_photo_file_name"
    t.string   "inspection_photo_content_type"
    t.integer  "inspection_photo_file_size"
    t.datetime "inspection_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspections", force: true do |t|
    t.string   "property"
    t.string   "unit_number"
    t.string   "inspector"
    t.string   "inspection_date"
    t.string   "attachments"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "components"
    t.boolean  "granite"
    t.boolean  "flooring"
    t.boolean  "appliances"
  end

  create_table "inspectors", force: true do |t|
    t.string   "inspector"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productionschedules", force: true do |t|
    t.string   "property"
    t.string   "unit"
    t.string   "componentrehabdate"
    t.string   "floorapplirehabdate"
    t.string   "blank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "fund"
    t.string   "manager"
    t.string   "property"
    t.string   "units"
    t.string   "city"
    t.string   "state"
    t.string   "purchase_price"
    t.string   "twophaserehab"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
