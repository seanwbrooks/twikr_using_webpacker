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

ActiveRecord::Schema.define(version: 20181222195008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_configurations", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "ask", null: false
    t.string "average_daily_volume", null: false
    t.string "change_percent_change", null: false
    t.string "change", null: false
    t.string "dividend_share", null: false
    t.string "eps_estimate_current_year", null: false
    t.string "eps_estimate_next_year", null: false
    t.string "eps_estimate_next_quarter", null: false
    t.string "days_low", null: false
    t.string "days_high", null: false
    t.string "year_low", null: false
    t.string "year_high", null: false
    t.string "holdings_gain_percent", null: false
    t.string "annualized_gain", null: false
    t.string "percent_change", null: false
    t.string "market_capitalization", null: false
    t.string "change_from_year_low", null: false
    t.string "percent_change_from_year_low", null: false
    t.string "change_from_year_high", null: false
    t.string "percent_change_from_year_high", null: false
    t.string "high_limit", null: false
    t.string "low_limit", null: false
    t.string "days_range", null: false
    t.string "fifty_day_moving_average", null: false
    t.string "percent_change_from_fiftyday_moving_average", null: false
    t.string "change_from_fiftyday_moving_average", null: false
    t.string "two_hundredday_moving_average", null: false
    t.string "change_from_two_hundredday_moving_average", null: false
    t.string "percent_change_from_two_hundredday_moving_average", null: false
    t.string "pe_ratio", null: false
    t.string "pegratio", null: false
    t.string "price_eps_estimate_current_year", null: false
    t.string "price_eps_estimate_next_year", null: false
    t.string "short_ratio", null: false
    t.string "ticker_trend", null: false
    t.string "oneyr_target_price", null: false
    t.string "volume", null: false
    t.string "holdings_value", null: false
    t.string "year_range", null: false
    t.string "days_value_change", null: false
    t.string "dividend_yield", null: false
    t.string "high", null: false
    t.string "low", null: false
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
