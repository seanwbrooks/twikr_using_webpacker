User.create(first_name: "Sean", last_name: "Brooks", username: "seanwbrooks", email: "swbrooks87@gmail.com", password: "Schwinn1", role: "member")
User.create(first_name: "Megan", last_name: "Brooks", username: "megannbrooks", email: "mnbrooks89@gmail.com", password: "Schwinn1", role: "member")

Tweet.create(ticker: "TSLA", ask: "243.00", percent_change: "-3.00 %", market_capitalization: "3.0B", rating: "Buy", body: "This is a great stock.", user_id: 1)
Tweet.create(ticker: "AAPL", ask: "144.00", percent_change: "3.00 %", market_capitalization: "24.6B", rating: "-", body: "This is a OK stock.", user_id: 2)
Tweet.create(ticker: "FB", ask: "141.00", percent_change: "-4.09 %", market_capitalization: "16.0B", rating: "Buy", body: "This is a bad stock.", user_id: 1)

Review.create(tweet_id: Tweet.first.id, user_id: User.first.id, comment: "I don't know if I like this stock.")
Review.create(tweet_id: Tweet.last.id, user_id: User.first.id, comment: "I think it's going up.")
Review.create(tweet_id: Tweet.last.id, user_id: User.last.id, comment: "I have this going to 200.00 by Q3.")
