require 'rails_helper'

describe Tweet do
  it { should belong_to :user }

  it { should have_valid(:ticker).when('tsla') }
  it { should_not have_valid(:ticker).when(nil, '') }

  it { should have_valid(:body).when('This is a stock to watch out for.') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_valid(:rating).when(1) }
  it { should_not have_valid(:rating).when(6) }
  it { should_not have_valid(:rating).when(-1) }
  it { should_not have_valid(:rating).when(nil) }
end
