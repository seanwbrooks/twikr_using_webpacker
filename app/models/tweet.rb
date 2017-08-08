class Tweet < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :ticker, presence: true
  validates :body, length: { maximum: 200 }

  def self.search(query)
    where("ticker like ?", "%#{query}%")
  end
end
