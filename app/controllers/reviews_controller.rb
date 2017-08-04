class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @reviews = @tweet.reviews
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @review = Review.new(review_params)
    @review.tweet = @tweet

    if @review.save
      flash[:notice] = "Review saved successfully."
      redirect_to @tweet
    else
      flash[:alert] = "Failed to save review."
    end
  end

  def destroy
    @review = Review.find(params(:review_id))
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:user, :comment)
end
