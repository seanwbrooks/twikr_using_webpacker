class AlphaVantage
  include HTTParty
  base_uri "https://www.alphavantage.co"

  def initialize(function, symbol, apikey)
      @options = {query: {function: function, symbol: symbol, apikey: apikey} }
  end

  def data
    self.class.get("/query?", @options)
  end
end
