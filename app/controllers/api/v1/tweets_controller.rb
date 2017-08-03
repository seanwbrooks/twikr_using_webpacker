class Api::V1::TweetsController < ApplicationController
  def index
    render json: Tweet.all, adapter: :json
  end

  def show
    @tweet = Tweet.find(params[:id])

    render json: @tweet, adapter: :json
  end
end
