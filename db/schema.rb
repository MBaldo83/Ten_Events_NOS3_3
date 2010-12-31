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

ActiveRecord::Schema.define(:version => 20101231111852) do

  create_table "all_events", :force => true do |t|
    t.string   "eventName"
    t.string   "bandName"
    t.string   "venue"
    t.string   "longitude"
    t.string   "latitude"
    t.time     "doorsOpen"
    t.string   "price"
    t.date     "eventDate"
    t.text     "description"
    t.text     "specialOffers"
    t.boolean  "ten_event"
    t.boolean  "all_TT_event"
    t.string   "city_location"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "taste"
    t.integer  "energyLevel"
    t.string   "new_taste"
  end

  create_table "event_searches", :force => true do |t|
    t.string   "urlOne"
    t.string   "bandName"
    t.string   "eventDateCSS"
    t.string   "eventNameCSS"
    t.string   "eventTimeCSS"
    t.string   "eventLocationCSS"
    t.string   "priceCSS"
    t.string   "descriptionCSS"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "myspaceSearch"
  end

  create_table "suggested_events", :force => true do |t|
    t.string   "eventName"
    t.string   "bandName"
    t.string   "venue"
    t.string   "longitude"
    t.string   "latitude"
    t.time     "doorsOpen"
    t.string   "price"
    t.date     "eventDate"
    t.text     "description"
    t.text     "specialOffers"
    t.string   "city_location"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "all_TT_event"
    t.boolean  "ten_event"
    t.string   "taste"
    t.integer  "energyLevel"
    t.string   "new_taste"
  end

  create_table "tastes", :force => true do |t|
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "encrypted_password"
    t.string    "salt"
  end

  create_table "venues", :force => true do |t|
    t.string   "venueName"
    t.string   "city_location"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "old_venue_name"
  end

end
