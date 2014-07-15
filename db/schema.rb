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

ActiveRecord::Schema.define(version: 20140715124254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "categories", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name",                                                      null: false
    t.integer  "province_id",                                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "geom",        limit: {:srid=>4326, :type=>"multi_polygon"}
  end

  add_index "cities", ["geom"], :name => "index_cities_on_geom", :spatial => true

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "iso_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "geom",       limit: {:srid=>4326, :type=>"multi_polygon"}
  end

  add_index "countries", ["geom"], :name => "index_countries_on_geom", :spatial => true

  create_table "grades", force: true do |t|
    t.string   "name",                    null: false
    t.integer  "degree",      default: 1
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "name",                                                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "geom",       limit: {:srid=>4326, :type=>"multi_polygon"}
  end

  add_index "provinces", ["geom"], :name => "index_provinces_on_geom", :spatial => true

  create_table "schools", force: true do |t|
    t.string   "name",                                                           null: false
    t.string   "address"
    t.string   "zipcode"
    t.string   "director"
    t.string   "website"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "city_id"
    t.integer  "province_id"
    t.integer  "grade_id"
    t.integer  "category_id"
    t.integer  "capacity",                                           default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "geom",         limit: {:srid=>4326, :type=>"point"}
  end

end
