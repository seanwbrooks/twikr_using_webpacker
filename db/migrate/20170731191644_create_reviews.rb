class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :tweet_id, null: false
      t.integer :user_id, null: false
      t.string :comment, null: false

      t.timestamp null: false
    end
  end
end
