class Review < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :comment, presence: true, length: { minimum: 4, maximum: 200 }
end
