FactoryBot.define do
  factory :tweet do
    ticker { "TSLA" }
    ask { "329.87" }
    percent_change { "3.45%" }
    market_capitalization { "34.0B" }
    rating { "Buy" }
    body { "This is body is used for testing" }
    user_id { 1 }
  end
end
