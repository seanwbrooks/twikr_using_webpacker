class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_reviews = @tweet.reviews
    render json: @tweet_reviews, adapter: :json
  end

  def create
    @data = JSON.parse(request.body.read)
    @new_review = Review.create(tweet_id: @data["tweet_id"], user_id: current_user.id, comment: @data["comment"])
    if @new_review.save
      ReviewMailer.new_review(@new_review).deliver_later
    end
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    render json: @tweets, adapter: :json
  end
end
