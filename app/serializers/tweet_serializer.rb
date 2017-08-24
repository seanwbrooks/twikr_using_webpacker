class TweetSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :reviews

  attributes :id, :ticker, :ask, :percent_change, :market_capitalization, :rating, :body, :user_id, :created_at, :updated_at

  def reviews
    customized_reviews = []
    object.reviews.each do |review|
      custom_review_object = {
        id: review.id,
        comment: review.comment,
        username: review.user.username
      }
      customized_reviews.push(custom_review_object)
    end
    return customized_reviews
  end
end
