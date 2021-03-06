class Api::V1::TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_user, only: [:destroy]

  def index
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    @current_user = current_user
    render json: @tweets, adapter: :json, meta: { 'current_user': @current_user }
  end

  def search
    if params[:stock] != ""
      @tweets = Tweet.where(ticker: params[:stock])
      render json: @tweets.order(updated_at: :desc), adapter: :json
    else
      @tweets = Tweet.order(updated_at: :desc)
      render json: @tweets, adapter: :json
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet, adapter: :json
  end

  def create
    data = JSON.parse(request.body.read)
    # Work on error handling and messages
    @message = handle_quote(data)
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    return render json: @tweets, adapter: :json
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    @tweets = Tweet.order(updated_at: :desc).limit(20)
    return render json: @tweets, adapter: :json
  end

  private

  def check_user
    @tweet = Tweet.find(params[:id])
    if @tweet.user != current_user
      @tweets = Tweet.order(updated_at: :desc).limit(20)
      return render json: @tweets, adapter: :json, alert: "Sorry, you don't have persmissions."
    end
  end

  def handle_quote(data)
    begin
      @stock = StockQuote::Stock.quote(data["ticker"])
      @pegratio = @stock["quote"]["PEGRatio"]
      @ask = @stock["quote"]["Ask"]
      @fiftyday = @stock["quote"]["FiftydayMovingAverage"]
      @buy_value = ((0.7) * @pegratio + (0.3) * (@ask - @fiftyday))
      @position = prediction(@buy_value)
      if validate_quote(@stock)
        Tweet.create(
          ticker: @stock["quote"]["symbol"],
          ask: @stock["quote"]["Ask"],
          percent_change: @stock["quote"]["PercentChange"],
          market_capitalization: @stock["quote"]["MarketCapitalization"],
          rating: @position,
          body: data["body"],
          user_id: current_user.id
        )
        @message = {"message" => "Save successful"}
      else
        @message = {"message" => "Stock not available at the moment"}
      end
    end
    @message
  end

  def validate_quote(stock)
    @valid = (stock["quote"]["symbol"] === nil || stock["quote"]["Ask"] === nil || stock["quote"]["PercentChange"])
  end

  def prediction(value)
    if @buy < 0
      @position = "High"
    elsif @buy < 0.5
      @position = "-"
    else
      @postion = "Low"
    end
    @position
  end

end
