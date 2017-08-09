require 'rails_helper'

describe Tweet do
  it { should belong_to :user }

  it { should have_valid(:ticker).when('tsla') }
  it { should_not have_valid(:ticker).when(nil, '') }

  it { should have_valid(:body).when('This is a stock to watch out for.') }

  it { should have_valid(:ask).when('23.00') }

  it { should have_valid(:percent_change).when('-3.00%') }

end
