class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.belongs_to :user
      t.belongs_to :tweet

      t.string :symbol, null: false
      t.string :ask, null: false
      t.string :average_daily_volume
      t.string :change_percent_change
      t.string :change
      t.string :dividend_share
      t.string :eps_estimate_current_year
      t.string :eps_estimate_next_year
      t.string :eps_estimate_next_quarter
      t.string :days_low
      t.string :days_high
      t.string :year_low
      t.string :year_high
      t.string :holdings_gain_percent
      t.string :annualized_gain
      t.string :percent_change
      t.string :market_capitalization
      t.string :change_from_year_low
      t.string :percent_change_from_year_low
      t.string :change_from_year_high
      t.string :percent_change_from_year_high
      t.string :high_limit
      t.string :low_limit
      t.string :days_range
      t.string :fifty_day_moving_average
      t.string :percent_change_from_fiftyday_moving_average
      t.string :change_from_fiftyday_moving_average
      t.string :two_hundredday_moving_average
      t.string :change_from_two_hundredday_moving_average
      t.string :percent_change_from_two_hundredday_moving_average
      t.string :pe_ratio
      t.string :pegratio
      t.string :price_eps_estimate_current_year
      t.string :price_eps_estimate_next_year
      t.string :short_ratio
      t.string :ticker_trend
      t.string :oneyr_target_price
      t.string :volume
      t.string :holdings_value
      t.string :year_range
      t.string :days_value_change
      t.string :dividend_yield
      t.string :high
      t.string :low

      t.timestamps
    end
  end
end
