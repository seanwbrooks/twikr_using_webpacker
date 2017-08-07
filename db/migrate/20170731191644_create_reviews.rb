class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :tweet, null: false
      t.belongs_to :user, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
