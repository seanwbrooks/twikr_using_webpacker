class Stock < ApplicationRecord
  has_many :users, through: :portfolios
  has_many :portfolios
  belongs_to :tweet

  validates :symbol, presence: true
end
