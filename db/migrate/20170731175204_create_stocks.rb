class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :symbol, null: false
      t.string :ask
      t.string :percent_change
      t.string :market_capitalization
      t.string :average_daily_volume
      t.string :dividend_share
      t.string :earning_share
      t.string :eps_estimate_current_year
      t.string :eps_estimate_next_year
      t.string :eps_estimate_next_quarter
      t.string :days_low
      t.string :days_high
      t.string :year_low
      t.string :year_high
      t.string :change_from_year_low
      t.string :percent_change_from_year_low
      t.string :change_from_year_high
      t.string :percent_change_from_year_high
      t.string :days_range
      t.string :fiftyday_moving_average
      t.string :two_hundredday_moving_average
      t.string :change_from_fiftyday_moving_average
      t.string :percent_change_from_fiftyday_moving_average
      t.string :pe_ratio
      t.string :peg_ratio
      t.string :price_eps_estimate_current_year
      t.string :price_eps_estimate_next_year
      t.string :shares_owned
      t.string :short_ratio
      t.string :volume
      t.string :year_range
      t.string :rating

      t.timestamps null: false
    end
  end
end
