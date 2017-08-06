class TweetSerializer < ActiveModel::Serializer
  has_many :reviews
  belongs_to :user

  attributes :id, :ticker, :ask, :percent_change, :market_capitalization, :rating, :body, :user_id, :created_at, :updated_at
end
