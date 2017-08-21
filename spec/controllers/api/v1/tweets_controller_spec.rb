require 'rails_helper'

RSpec.describe Api::V1::TweetsController, type: :controller do
  describe "GET #index" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @tweet = Tweet.create(ticker: "TSLA", ask: "325.78", percent_change: "3.45%", market_capitalization: "3.0B", rating: "High", body: "This is a test for Tweet body.", user_id: @user.id)
      @tweet_two = Tweet.create(ticker: "AAPL", ask: "144.78", percent_change: "-1.45%", market_capitalization: "26B", rating: "Low", body: "This is a test for Tweet2 body.", user_id: @user.id)
      get :index, format: :json
    end


    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns a list of most recent tweets" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body["tweets"][0]).to have_content("AAPL")
      expect(hash_body["tweets"][1]).to have_content("TSLA")
    end
  end

  describe "GET #search" do
    context "when search isn't blank" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @tweet = Tweet.create(ticker: "TSLA", ask: "325.78", percent_change: "3.45%", market_capitalization: "3.0B", rating: "High", body: "This is a test for Tweet body.", user_id: @user.id)
        @tweet_two = Tweet.create(ticker: "AAPL", ask: "144.78", percent_change: "-1.45%", market_capitalization: "26B", rating: "Low", body: "This is a test for Tweet2 body.", user_id: @user.id)
        get :search, params: {stock: "TSLA"}, format: :json
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns with JSON body containing expected search attributes" do
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body["tweets"][0]["ticker"]).to eq("TSLA")
        expect(hash_body["tweets"][0]["ask"]).to eq("325.78")
        expect(hash_body["tweets"][0]["percent_change"]).to eq("3.45%")
        expect(hash_body["tweets"][0]["market_capitalization"]).to eq("3.0B")
        expect(hash_body["tweets"][0]["rating"]).to eq("High")
        expect(hash_body["tweets"][0]["body"]).to eq("This is a test for Tweet body.")
        expect(hash_body["tweets"][0]["reviews"].length).to eq(0)
        expect(hash_body["tweets"][0]["user"]["first_name"]).to eq("John")
      end
    end

    context "when search is blank" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @tweet = Tweet.create(ticker: "TSLA", ask: "325.78", percent_change: "3.45%", market_capitalization: "3.0B", rating: "High", body: "This is a test for Tweet body.", user_id: @user.id)
        @tweet_two = Tweet.create(ticker: "AAPL", ask: "144.78", percent_change: "-1.45%", market_capitalization: "26B", rating: "Low", body: "This is a test for Tweet2 body.", user_id: @user.id)
        get :search, params: {stock: ""}, format: :json
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns with JSON body containing expected search attributes" do
        hash_body = nil
        expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
        expect(hash_body["tweets"][0]["ticker"]).to eq("AAPL")
        expect(hash_body["tweets"][1]["ticker"]).to eq("TSLA")
      end
    end
  end

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @tweet = Tweet.create(ticker: "TSLA", ask: "325.78", percent_change: "3.45%", market_capitalization: "3.0B", rating: "High", body: "This is a test for Tweet body.", user_id: @user.id)
      get :show, params: {id: @tweet.id}, format: :json
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns with JSON body containing expected Tweet attributes" do
      hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body["tweet"]["ticker"]).to eq("TSLA")
      expect(hash_body["tweet"]["ask"]).to eq("325.78")
      expect(hash_body["tweet"]["percent_change"]).to eq("3.45%")
      expect(hash_body["tweet"]["market_capitalization"]).to eq("3.0B")
      expect(hash_body["tweet"]["rating"]).to eq("High")
      expect(hash_body["tweet"]["body"]).to eq("This is a test for Tweet body.")
      expect(hash_body["tweet"]["reviews"].length).to eq(0)
      expect(hash_body["tweet"]["user"]["first_name"]).to eq("John")
    end
  end

  describe "POST #create" do
    context "user successfully creates post" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      let(:tweet) do
        {
          ticker: "TSLA",
          body: "This is a test for body."
        }.to_json
      end

      it "creates a new tweet" do
        expect{ post(:create, body: tweet) }.to change(Tweet, :count).by(1)
      end

      it "returns a json with newly created tweet" do
        post(:create, body: tweet)
        returned_json = JSON.parse(response.body)

        expect(response.status).to eq(200)

        expect(returned_json).to be_a(Hash)
        expect(returned_json["tweets"][0]["ticker"]).to eq("TSLA")
        expect(returned_json["tweets"][0]["body"]).to eq("This is a test for body.")
      end
    end
  end

  describe "DELETE #destroy" do
    context "user successfully deletes own post" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @tweet = Tweet.create(ticker: "TSLA", ask: "325.78", percent_change: "3.45%", market_capitalization: "3.0B", rating: "High", body: "This is a test for Tweet body.", user_id: @user.id)
        @review = Review.create(comment: "This is a review.", user_id: @user.id, tweet_id: @tweet.id)
      end

      it "returns json without tweet" do
        delete :destroy, params: { id: @tweet.id }
        returned_json = JSON.parse(response.body)
        expect(returned_json).to_not include("TSLA")
        expect(Tweet.all.count).to eq(0)
      end
    end

    context "user cannot delete other post" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @user_two = FactoryGirl.create(:user)
        sign_in @user_two
        @tweet = Tweet.create(ticker: "TSLA", ask: "325.78", percent_change: "3.45%", market_capitalization: "3.0B", rating: "High", body: "This is a test for Tweet body.", user_id: @user.id)
        @review = Review.create(comment: "This is a review.", user_id: @user.id, tweet_id: @tweet.id)
      end

      it "returns json with tweet" do
        delete :destroy, params: { id: @tweet.id }
        returned_json = JSON.parse(response.body)
        expect(returned_json["tweets"][0]["ticker"]).to include("TSLA")
        expect(Tweet.all.count).to eq(1)
      end
    end
  end
end
