class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    json = JSON.parse(request.body.read)
    @stock = StockQuote::Stock.json_quote(json["ticker"])
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
