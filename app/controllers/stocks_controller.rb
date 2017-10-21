class StocksController < ApplicationController
  def scrape(url)
    require 'openssl'
    doc = Nokogiri::HTML(open("#{url}",
    :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
  end

  def trending_tickers
    tickers = []
    url = 'https://finance.yahoo.com/trending-tickers'
    regex = /[A-Z]+/

    yahoo_trending_tickers = scrape(url).css('td').css('a')

    yahoo_trending_tickers.map do |a|
      symbol = a.text
      if (symbol != "" && regex.match(symbol)[0] == symbol)
        tickers.push(symbol)
      end
    end
    tickers
  end

  def ticker_data
    tickers = trending_tickers

    tickers.each do |ticker|
      ticker_container = []

      data = scrape("https://finance.yahoo.com/quote/#{ticker}?p=#{ticker}").css('td')

      data.map do |data_points|
        data_points = data_points.text
        ticker_container.push(data_points)
      end

      binding.pry
      @trending_ticker_instance = Stock.new(ticker, ticker_container)
      if @trending_ticker_instance.validate
        @trending_ticker_instance.save
      end
    end
  end
end
