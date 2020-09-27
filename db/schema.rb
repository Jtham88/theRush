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

ActiveRecord::Schema.define(version: 20200927190048) do

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "player"
    t.string   "team"
    t.string   "position"
    t.integer  "attempts"
    t.decimal  "attempts_per_game",          precision: 10
    t.integer  "yds"
    t.decimal  "avg",                        precision: 10
    t.decimal  "yards_per_game",             precision: 10
    t.integer  "touchdowns"
    t.string   "longest_rush"
    t.string   "first_rush_downs"
    t.decimal  "first_rush_down_percentage", precision: 10
    t.integer  "rushing_20_yards"
    t.integer  "rushing_40_yards"
    t.integer  "fumbles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
