class Api::V1::TweetsController < ApplicationController
  def index
    render json: Tweet.all, adapter: :json
  end
end
