class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published? #returns if tweet_id column is already populated
    return if tweet.publish_at > Time.current #returns if updated tweet date/time is moved to later date/time to prevent jobs from posting twice
    tweet.publish_to_twitter!
  end
end
