
module TwitterApi
    module V2
        class Client
            def lookup_user_liked_tweets(user_id)
                response = connection1.get("/2/users/#{user_id}/liked_tweets?user.fields=username")
                parsed_response = JSON.parse(response.body)
            end

            def lookup_user_following(user_id)
                response = connection1.get("/2/users/#{user_id}/following")
                parsed_response = JSON.parse(response.body)
            end

            def lookup_user_followers(user_id)
                response = connection1.get("2/users/#{user_id}/followers")
                parsed_response = JSON.parse(response.body)
            end

            def lookup_single_user(username)
                response = connection1.get("/2/users/by/username/#{username}")
                parsed_response = JSON.parse(response.body)
            end

            def lookup_single_tweet(tweet_id)
                response = connection1.get("/2/tweets/#{tweet_id}")
                parsed_response =  JSON.parse(response.body)
            end

            private

            def connection1
                @conn ||= Faraday.new(
                    url: "https://api.twitter.com",
                    headers: { 
                        "Authorization" => "Bearer #{Rails.application.credentials.bearer_token}"
                    }
                )
            end

            #     def connection2
            #         @conn ||= Faraday.new(
            #             url: "https://api.twitter.com"
            #             headers: {
            #                 "Authorization" => "OAuth oauth_consumer_key=#{Rails.application.credentials}, "
            #             }
            #         )
            #     end
        end
    end
end

#request["Authorization"] = "OAuth oauth_consumer_key=\"1ztlmo3ctMqDuNajSteVzOD4H\",oauth_token=\"1509799816460611585-7iv3sjKOlaGQr3CtBeN5ZAovvgoFqr\",oauth_signature_method=\"HMAC-SHA1\",oauth_timestamp=\"1649052086\",oauth_nonce=\"p6fTJOwr1LK\",oauth_version=\"1.0\",oauth_signature=\"d9e5G1DD6L3pLr4OUA9YesVug20%3D\""