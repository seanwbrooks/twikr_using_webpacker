class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    @review_user = "#{@review.user.first_name} #{@review.user.last_name}"
    @tweet_user_email = review.tweet.user.email
    mail(
      to: @tweet_user_email,
      subject: "#{@review_user} commented on your post."
    )
  end
end
