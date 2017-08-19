require 'rails_helper'

describe Tweet do
  #validate associations
  it { should belong_to :user }

  #validations with expected input
  it { should have_valid(:ticker).when('TSLA') }
  it { should have_valid(:body).when('This is a stock to watch out for.') }
  it { should have_valid(:ask).when('23.00') }
  it { should have_valid(:percent_change).when('-3.00%') }

  #validations with invalid input
  it { should_not have_valid(:ticker).when(nil, '') }
end

RSpec.describe 'Tweet' do
  context 'making new tweet' do
    let(:user) { FactoryGirl.build(:user) }
    let(:tweet) { FactoryGirl.build(:tweet) }

    it 'has a valid inputs' do
      expect(tweet.ticker).to include("TSLA")
      expect(tweet.ask).to include("329.87")
      expect(tweet.percent_change).to include("3.45%")
      expect(tweet.rating).to include("Buy")
      expect(tweet.body).to include("This is body is used for testing")
      expect(tweet.user_id).to be(1)
    end
  end
end
