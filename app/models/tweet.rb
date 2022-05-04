class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: {minimum: 1, maximum: 280}
  validates :publish_at, presence: true

  # sets the default value of publish_at datetime_select to 1 day later upon initialize
  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  def published?
    self.tweet_id? #adding ? to a column checks whether there is value by returning a boolean
  end
end
