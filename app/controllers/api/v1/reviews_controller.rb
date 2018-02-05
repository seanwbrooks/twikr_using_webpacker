class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_reviews = @tweet.reviews
    render json: @tweet_reviews, adapter: :json
  end

  def create
    data = JSON.parse(request.body.read)
    @new_review = Review.create(tweet_id: data["tweet_id"], user_id: current_user.id, comment: data["comment"])
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    render json: @tweets, adapter: :json
  end

  def destroy
    @review = Review.find(params[:id])
    if user_review?(@review)
      @review.destroy
    end
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    render json: @tweets, adapter: :json
  end

  private

  def user_review?(review)
    check = false
    @review = Review.find(params[:id])
    if @review.user == current_user
      check = true
    end
    check
  end
end
