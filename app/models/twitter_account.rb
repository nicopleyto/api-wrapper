class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy
  validates :username, uniqueness: true #prevents record from being created twice

  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.api_key
      config.consumer_secret     = Rails.application.credentials.api_key_secret
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end
  end

end
