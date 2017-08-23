class ReviewSerializer < ActiveModel::Serializer
  belongs_to :tweet
  belongs_to :user
  has_one :user

  attributes :id, :comment, :user_id, :tweet_id, :created_at, :updated_at
end
