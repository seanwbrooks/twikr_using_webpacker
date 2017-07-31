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

ActiveRecord::Schema.define(version: 20170731175552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol", null: false
    t.string "ask"
    t.string "percent_change"
    t.string "market_capitalization"
    t.string "average_daily_volume"
    t.string "dividend_share"
    t.string "earning_share"
    t.string "eps_estimate_current_year"
    t.string "eps_estimate_next_year"
    t.string "eps_estimate_next_quarter"
    t.string "days_low"
    t.string "days_high"
    t.string "year_low"
    t.string "year_high"
    t.string "change_from_year_low"
    t.string "percent_change_from_year_low"
    t.string "change_from_year_high"
    t.string "percent_change_from_year_high"
    t.string "days_range"
    t.string "fiftyday_moving_average"
    t.string "two_hundredday_moving_average"
    t.string "change_from_fiftyday_moving_average"
    t.string "percent_change_from_fiftyday_moving_average"
    t.string "pe_ratio"
    t.string "peg_ratio"
    t.string "price_eps_estimate_current_year"
    t.string "price_eps_estimate_next_year"
    t.string "shares_owned"
    t.string "short_ratio"
    t.string "volume"
    t.string "year_range"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "stock", null: false
    t.string "body", null: false
    t.integer "rating", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "member", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
