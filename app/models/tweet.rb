class Tweet < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :ticker, presence: true
  validates :body, presence: true, length: { minimum: 4, maximum: 200 }

  def self.search(query)
    where("ticker like ?", "%#{query}%")
  end
end
