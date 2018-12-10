FactoryBot.define do
  factory :review do
    comment { "This is a test for comment." }
    user_id { 1 }
    tweet_id { 1 }
  end
end
