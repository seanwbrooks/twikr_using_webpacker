class Api::V1::TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tweets = Tweet.all
    render json: Tweet.order(updated_at: :desc).limit(20), adapter: :json
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet, adapter: :json
  end

  def create
    unless current_user
      return render json: { errors: 'Must sign in'}, status: 403
    end
    data = JSON.parse(request.body.read)
    @stock = StockQuote::Stock.json_quote(data["ticker"])
    @pegratio = @stock["quote"]["PEGRatio"].to_f
    @ask = @stock["quote"]["Ask"].to_f
    @fiftyday = @stock["quote"]["FiftydayMovingAverage"].to_f
    @buy = ((0.7) * @pegratio + (0.3) * (@ask - @fiftyday))
    @position = "-"
    if @buy < 1
      @position = "Buy"
    end
    @new_tweet = Tweet.new(
      ticker: @stock["quote"]["symbol"],
      ask: @stock["quote"]["Ask"],
      percent_change: @stock["quote"]["PercentChange"],
      market_capitalization: @stock["quote"]["MarketCapitalization"],
      rating: @position,
      body: data["body"],
      user_id: current_user.id)
      binding.pry
    if @new_tweet.save
      return render json: @new_tweet, adapter: :json
    else
      return render json: {}, adapter: :json
    end
  end
end
