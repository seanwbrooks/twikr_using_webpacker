class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.integer :user_id, null: false
      t.integer :stock_id, null: false

      t.timestamps, null: false
    end
  end
end
