class TweetsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]

  def check_user
    @tweet = Tweet.find(params[:id])
    if @tweet.user != current_user || !current_user.admin?
      redirect_to tweets_path, alert: "Sorry, you don't have persmissions."
    end
  end

  def index
    @tweets = Tweet.search(params[:search])
    unless params[:search]
      Tweet.order(updated_at: :desc).limit(20)
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

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    binding.pry
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:ticker, :body)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
