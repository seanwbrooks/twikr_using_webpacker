class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.search(params[:search])
    if params[:search]
      Tweet.search(params[:search])
    else
      Tweet.all
    end
    @tweets.order(updated_at: :desc).limit(20)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @reviews = @tweet.reviews
    @review = Review.new
  end

  def new
    @tweet = Tweet.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update_attributes(tweet_params)
    if @tweet.save
      redirect_to tweet_path(@tweet), notice: "Post has been updated successfully."
    else
      render action: 'edit'
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @stock = StockQuote::Stock.json_quote(@tweet.ticker)
    @pegratio = @stock["quote"]["PEGRatio"].to_f
    @ask = @stock["quote"]["Ask"].to_f
    @fiftyday = @stock["quote"]["FiftydayMovingAverage"].to_f
    @buy = ((0.7) * @pegratio + (0.3) * (@ask - @fiftyday))
    @position = "-"
    if @buy < 1
      @position = "Buy"
    end

    if @stock["quote"]["symbol"] == nil || @stock["quote"]["Ask"] == nil
      binding.pry
      render :new
    else
      @new_tweet = Tweet.create(
        ticker: @stock["quote"]["symbol"],
        ask: @stock["quote"]["Ask"],
        percent_change: @stock["quote"]["PercentChange"],
        market_capitalization: @stock["quote"]["MarketCapitalization"],
        rating: @position,
        body: @tweet.body,
        user_id: current_user.id)

      redirect_to tweets_path, notice: "Post was completed successfully."
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:ticker, :body)
  end

  def check_user
    @tweet = Tweet.find(params[:id])
    if @tweet.user != current_user
      redirect_to tweets_path, alert: "Sorry, you don't have persmissions."
    end
  end
end
