class Tweet < ApplicationRecord
  has_many :reviews
  has_many :stocks
  belongs_to :user

  validates :ticker, presence: true
  validates :body, presence: true, length: { minimum: 1, maximum: 200 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6 }
end
