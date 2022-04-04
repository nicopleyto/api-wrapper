class OmniauthCallbacksController < ApplicationController
  def connect_twitter
    @twitter_account = current_user.twitter_accounts.find_or_create_by(username: auth.info.nickname) do |twitter_account|
      twitter_account.name: auth.info.name,
      twitter_account.image: auth.info.image,
      twitter_account.token: auth.credentials.token,
      twitter_account.secret: auth.credentials.secret
    end

    redirect_to root_path, notice: "Twitter account has been successfully connected."
  end

  private

  #helper method from omniauth which contains a hash of information about the user when sent to the callback url
  def auth_hash
    request.env['omniauth.auth']
  end
end
