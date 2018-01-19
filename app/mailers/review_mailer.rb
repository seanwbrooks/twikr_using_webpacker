class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: review.users.email,
      subject: "New review posted for #{review.users.name}"
    )
  end
end
