class StocksController < ApplicationController
  def trending_tickers
    @tickers = []

    require 'openssl'
    doc = Nokogiri::HTML(open('https://finance.yahoo.com/trending-tickers',
    :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @yahoo_trending_tickers = doc.css('td').css('a')

    @yahoo_trending_tickers.map do |a|
      @symbol = a.text
      if (@symbol != "")
        @tickers.push(@symbol)
      end
    end
    @tickers
  end

  def web_scrap_trending_tickers
    @tickers = trending_tickers

    @tickers.each do |ticker|
      @ticker_container = []

      require 'openssl'
      doc = Nokogiri::HTML(open("https://finance.yahoo.com/quote/#{ticker}?p=#{ticker}",
       :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      data = doc.css('td')

      data.map do |data_points|
        @data_points = data_points.text
        @ticker_container.push(@data_points)
      end
      binding.pry
    end
  end

  def create

  end
end
