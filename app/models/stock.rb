class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :symbol, null: false
  validates :ask, null: false
  validates :average_daily_volume, null: false
  validates :change_percent_change, null: false
  validates :change, null: false
  validates :dividend_share, null: false
  validates :eps_estimate_current_year, null: false
  validates :eps_estimate_next_year, null: false
  validates :eps_estimate_next_quarter, null: false
  validates :days_low, null: false
  validates :days_high, null: false
  validates :year_low, null: false
  validates :year_high, null: false
  validates :holdings_gain_percent, null: false
  validates :annualized_gain, null: false
  validates :percent_change, null: false
  validates :market_capitalization, null: false
  validates :change_from_year_low, null: false
  validates :percent_change_from_year_low, null: false
  validates :change_from_year_high, null: false
  validates :percent_change_from_year_high, null: false
  validates :high_limit, null: false
  validates :low_limit, null: false
  validates :days_range, null: false
  validates :fifty_day_moving_average, null: false
  validates :percent_change_from_fiftyday_moving_average, null: false
  validates :change_from_fiftyday_moving_average, null: false
  validates :two_hundredday_moving_average, null: false
  validates :change_from_two_hundredday_moving_average, null: false
  validates :percent_change_from_two_hundredday_moving_average, null: false
  validates :pe_ratio, null: false
  validates :pegratio, null: false
  validates :price_eps_estimate_current_year, null: false
  validates :price_eps_estimate_next_year, null: false
  validates :short_ratio, null: false
  validates :ticker_trend, null: false
  validates :oneyr_target_price, null: false
  validates :volume, null: false
  validates :holdings_value, null: false
  validates :year_range, null: false
  validates :days_value_change, null: false
  validates :dividend_yield, null: false
  validates :high, null: false
  validates :low, null: false

  def self.create(ticker)
    @stock = StockQuote::Stock.json_quote(data["ticker"])
    @pegratio = @stock["quote"]["PEGRatio"].to_f
    @ask = @stock["quote"]["Ask"].to_f
    @fiftyday = @stock["quote"]["FiftydayMovingAverage"].to_f
    @buy = ((0.7) * @pegratio + (0.3) * (@ask - @fiftyday))
    @position = "-"
    if @buy < 0
      @position = "High"
    elsif @buy < 0.5
      @position = "-"
    else
      @postion = "Low"
    end
    @new_tweet = Tweet.new(
      ticker: @stock["quote"]["symbol"],
      ask: @stock["quote"]["Ask"],
      percent_change: @stock["quote"]["PercentChange"],
      market_capitalization: @stock["quote"]["MarketCapitalization"],
      rating: @position,
      body: data["body"],
      user_id: current_user.id)
    if @new_tweet.ticker == nil || @new_tweet.ask == nil || @new_tweet.percent_change == nil
      @tweets_without_post = Tweet.order(updated_at: :desc).limit(20)
      return render json: @tweets_without_post, adapter: :json
    else
      @new_tweet.save
      @tweets = Tweet.order(updated_at: :desc).limit(20)
      return render json: @tweets, adapter: :json
    end
  end

  def self.search(query)
    where("symbol like ?", "%#{query}%")
  end
end
