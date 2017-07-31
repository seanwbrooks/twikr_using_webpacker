class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.integer :user_id, null: false
      t.string :stock, null: false
      t.string :body, null: false
      t.integer :rating, null: false, default: 0

      t.timestamp null: false
    end
  end
end
