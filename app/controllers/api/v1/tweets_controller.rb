class Api::V1::TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_user, only: [:destroy]

  def index
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    render json: @tweets, adapter: :json
  end

  def search
    if params[:stock] != ""
      @tweets = Tweet.where(ticker: params[:stock])
      render json: @tweets.order(updated_at: :desc), adapter: :json
    else
      @tweets = Tweet.order(updated_at: :desc)
      render json: @tweets, adapter: :json
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet, adapter: :json
  end

  def create
    data = JSON.parse(request.body.read)
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

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    return render json: @tweets, adapter: :json
  end

  private

  def check_user
    @tweet = Tweet.find(params[:id])
    if @tweet.user != current_user
      @tweets = Tweet.order(updated_at: :desc).limit(20)
      return render json: @tweets, adapter: :json, alert: "Sorry, you don't have persmissions."
    end
  end
end
