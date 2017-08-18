require 'rails_helper'

describe Review do
  #validates associations
  it { should belong_to :tweet }

  #validate expected inputs
  it { should have_valid(:comment).when('This is a comment.') }

  #validates invalid inputs
  it { should_not have_valid(:comment).when(nil, '') }
end

RSpec.describe "Review" do
  context "create a review" do
    #initialize models
    let(:user){ FactoryGirl.build(:user) }
    let(:tweet){ FactoryGirl.build(:tweet) }
    let(:review){ FactoryGirl.build(:review) }

    it "has a comment" do
      expect(review.comment).to include("This is a test for comment.")
    end

    it "has user association" do
      expect(review.user_id).to be(1)
    end

    it "has tweet association" do
      expect(review.tweet_id).to be(1)
    end
  end
end
