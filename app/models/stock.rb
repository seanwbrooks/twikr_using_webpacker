class Stock < ApplicationRecord
  has_many :users, through: :portfolio
  
  validates :symbol, presence: true

end
