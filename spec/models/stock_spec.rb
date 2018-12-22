require 'rails_helper'

RSpec.describe Stock, type: :model do
  #validates associations
  it { should belong_to :tweet }
  it { should belong_to :user }

  #validate expected inputs
  it { should have_valid(:symbol).when('TSLA') }

end

RSpec.describe "Stock" do
  context "create a stock" do
    #initialize models
    let(:user) { FactoryBot.build(:user) }
    let(:tweet) { FactoryBot.build(:tweet) }
    let(:stock) { FactoryBot.build(:stock) }

    it "has user association" do
      expect(stock.user_id).to be(1)
    end

    it "has tweet association" do
      expect(stock.tweet_id).to be(1)
    end
  end
end
