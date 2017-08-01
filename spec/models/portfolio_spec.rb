require 'rails_helper'

describe Portfolio, type: :model do
  it { should belong_to :user }
  it { should belong_to :stock }
end
