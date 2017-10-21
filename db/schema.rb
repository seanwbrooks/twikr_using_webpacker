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

ActiveRecord::Schema.define(version: 20171007122715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.bigint "tweet_id", null: false
    t.bigint "user_id", null: false
    t.string "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_reviews_on_tweet_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.string "symbol", null: false
    t.string "ask"
    t.string "average_daily_volume"
    t.string "change_percent_change"
    t.string "change"
    t.string "dividend_share"
    t.string "eps_estimate_current_year"
    t.string "eps_estimate_next_year"
    t.string "eps_estimate_next_quarter"
    t.string "days_low"
    t.string "days_high"
    t.string "year_low"
    t.string "year_high"
    t.string "holdings_gain_percent"
    t.string "annualized_gain"
    t.string "percent_change"
    t.string "market_capitalization"
    t.string "change_from_year_low"
    t.string "percent_change_from_year_low"
    t.string "change_from_year_high"
    t.string "percent_change_from_year_high"
    t.string "high_limit"
    t.string "low_limit"
    t.string "days_range"
    t.string "fifty_day_moving_average"
    t.string "percent_change_from_fiftyday_moving_average"
    t.string "change_from_fiftyday_moving_average"
    t.string "two_hundredday_moving_average"
    t.string "change_from_two_hundredday_moving_average"
    t.string "percent_change_from_two_hundredday_moving_average"
    t.string "pe_ratio"
    t.string "pegratio"
    t.string "price_eps_estimate_current_year"
    t.string "price_eps_estimate_next_year"
    t.string "short_ratio"
    t.string "ticker_trend"
    t.string "oneyr_target_price"
    t.string "volume"
    t.string "holdings_value"
    t.string "year_range"
    t.string "days_value_change"
    t.string "dividend_yield"
    t.string "high"
    t.string "low"
    t.string "beta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_stocks_on_tweet_id"
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "ticker", null: false
    t.string "ask", null: false
    t.string "percent_change", null: false
    t.string "market_capitalization", null: false
    t.string "rating", null: false
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "username", default: "", null: false
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
    t.string "profile_photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
