class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :symbol, null: false
      t.string :ask
      t.string :percent_change
      t.string :market_capitalization
      t.string :fiftyday_moving_average
      t.string :peg_ratio
      t.string :volume
      t.string :rating
      t.integer :tweet_id

      t.timestamps null: false
    end
  end
end
