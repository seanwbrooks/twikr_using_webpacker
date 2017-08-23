class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_reviews = @tweet.reviews
    render json: @tweet_reviews.reverse, adapter: :json
  end

  def create
    binding.pry
  end
end
