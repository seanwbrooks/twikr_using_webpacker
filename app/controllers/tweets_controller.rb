class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @reviews = @tweet.reviews
  end

  def new
    @tweet = Tweet.new
  end

  def create
    json = JSON.parse(request.body.read)
    @stock = StockQuote::Stock.json_quote(json["ticker"])
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.destroy
  end
end
