class Tweet < ApplicationRecord
  belongs_to :user
  has_many :reviews
  
  validates :body, presence: true, length: { minimum: 1, maximum: 200 }
end
