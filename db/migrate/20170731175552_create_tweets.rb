class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :ticker, null: false
      t.string :ask, null: false
      t.string :percent_change, null: false
      t.string :market_capitalization, null: false
      t.string :rating, null: false
      t.string :body
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
