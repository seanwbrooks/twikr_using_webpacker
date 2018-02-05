RSpec.describe "Test sending email with sidekiq", :type => :request do
  it "send email to sidekiq" do
    review = Review.last
    expect { ReviewMailer.new_review(review).deliver_later }
      .to change( Sidekiq::Worker.jobs, :size ).by(1)
  end
end
