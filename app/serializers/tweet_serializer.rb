class TweetSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :body
end
