class StocksController < ApplicationController
  def stock
    require 'openssl'
    doc = Nokogiri::HTML(open('http://www.marketwatch.com/investing/stock/goog/profile',
     :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    entries = doc.css('.maincontent')
    binding.pry
  end
end
