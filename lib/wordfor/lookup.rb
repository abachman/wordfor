require 'httparty'

# http://words.bighugelabs.com/api/2/API_KEY/word/json
module Wordfor
  class Lookup
    include HTTParty
    base_uri 'words.bighugelabs.com'

    def initialize(api_key)
      @api_key = api_key
    end

    def lookup(word)
      self.class.get("/api/2/#{ @api_key }/#{ word }/json")
    end
  end
end
