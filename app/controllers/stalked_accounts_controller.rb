class StalkedAccountsController < ApplicationController

    def stalk_user
    end

    def stalk_info
        client = TwitterApi::V2::Client.new
        @stalked_user = client.lookup_single_user(params[:username])
        @followers = client.lookup_user_followers(@stalked_user["data"]["id"])
        @followed_accounts = client.lookup_user_following(@stalked_user["data"]["id"])
        @liked_tweets = client.lookup_user_liked_tweets(@stalked_user["data"]["id"])
    end
end
