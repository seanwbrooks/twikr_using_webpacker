class Review < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :tweet_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true, length: { minimum: 1, maximum: 140 }
end
