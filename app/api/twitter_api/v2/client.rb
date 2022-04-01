class Client
    def tweet_lookup(tweet_id)
        connection = Faraday.new(url: "https://api.twitter.com/2")
        response = connection.get()
    end
end