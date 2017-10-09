class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.belongs_to :user
      t.belongs_to :tweet

      t.string :symbol, null: false
      t.string :ask, null: false
      t.string :average_daily_volume, null: false
      t.string :change_percent_change, null: false
      t.string :change, null: false
      t.string :dividend_share, null: false
      t.string :eps_estimate_current_year, null: false
      t.string :eps_estimate_next_year, null: false
      t.string :eps_estimate_next_quarter, null: false
      t.string :days_low, null: false
      t.string :days_high, null: false
      t.string :year_low, null: false
      t.string :year_high, null: false
      t.string :holdings_gain_percent, null: false
      t.string :annualized_gain, null: false
      t.string :percent_change, null: false
      t.string :market_capitalization, null: false
      t.string :change_from_year_low, null: false
      t.string :percent_change_from_year_low, null: false
      t.string :change_from_year_high, null: false
      t.string :percent_change_from_year_high, null: false
      t.string :high_limit, null: false
      t.string :low_limit, null: false
      t.string :days_range, null: false
      t.string :fifty_day_moving_average, null: false
      t.string :percent_change_from_fiftyday_moving_average, null: false
      t.string :change_from_fiftyday_moving_average, null: false
      t.string :two_hundredday_moving_average, null: false
      t.string :change_from_two_hundredday_moving_average, null: false
      t.string :percent_change_from_two_hundredday_moving_average, null: false
      t.string :pe_ratio, null: false
      t.string :pegratio, null: false
      t.string :price_eps_estimate_current_year, null: false
      t.string :price_eps_estimate_next_year, null: false
      t.string :short_ratio, null: false
      t.string :ticker_trend, null: false
      t.string :oneyr_target_price, null: false
      t.string :volume, null: false
      t.string :holdings_value, null: false
      t.string :year_range, null: false
      t.string :days_value_change, null: false
      t.string :dividend_yield, null: false
      t.string :high, null: false
      t.string :low, null: false

      t.timestamps
    end
  end
end
