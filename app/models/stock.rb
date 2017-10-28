class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def self.new(ticker, ticker_info)
    ticker_object = Hash.new
    previous_values = []
    ticker_info.each_with_index do |value, index|
      if index % 2 == 0
        ticker_object[value] = "empty"
        previous_values.push(value)
      else
        ticker_object[previous_values[(index - (index + 1))]] = value
      end
    end
    ticker_object
  end

end
