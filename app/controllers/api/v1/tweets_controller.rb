class Api::V1::TweetsController < ApplicationController
  def index
    render Tweet.all, adapter: :json
  end
end
