class Tweet < ApplicationRecord
  has_many :reviews
  belongs_to :user
  delegate :username, to: :user

  validates :ticker, presence: true
  validates :body, presence: true, length: { minimum: 4, maximum: 200 }
end
