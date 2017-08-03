class TweetSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :ask, :percent_change, :market_capitalization, :rating, :body, :user_id
end
