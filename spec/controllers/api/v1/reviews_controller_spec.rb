require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @tweet = Tweet.create(ticker: "TSLA", ask: "325.78", percent_change: "3.45%", market_capitalization: "3.0B", rating: "High", body: "This is a test for Tweet body.", user_id: @user.id)
    @review = Review.create(comment: "This is a test for reviews.", tweet_id: @tweet.id, user_id: @user.id)
    @review_two = Review.create(comment: "This is a second test for reviews.", tweet_id: @tweet.id, user_id: @user.id)
    get :index, params: {tweet_id: @tweet.id}, format: :json
  end

  describe "GET #index" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns a list of reviews" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body["reviews"][0]).to have_content("This is a test for reviews.")
      expect(hash_body["reviews"][1]).to have_content("This is a second test for reviews.")
    end
  end

  describe "DELETE #destroy" do
    context "user successfully deletes own review" do
      it "returns json without review" do
        delete :destroy, params: { id: @review.id }
        returned_json = JSON.parse(response.body)
        expect(returned_json).to_not include("This is a test for reviews.")
        expect(Review.all.count).to eq(1)
      end
    end
  end
end
