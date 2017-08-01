require 'rails_helper'

describe Stock do
  it { should belong_to :tweet }

  it { should have_valid(:symbol).when('tsla') }

end
