class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def self.new(ticker, ticker_container)
    binding.pry
  end
end
