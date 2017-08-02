require 'rails_helper'

describe Review do
  it { should belong_to :tweet }

  it { should have_valid(:comment).when('This is a comment.') }
  it { should_not have_valid(:comment).when(nil, '') }

end
