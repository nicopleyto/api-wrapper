class OmniauthCallbacksController < ApplicationController
  def connect_twitter
    twitter_account = current_user.twitter_accounts.where(username: auth_hash.info.nickname).first_or_create
    twitter_account.update(
      name: auth_hash.info.name,
      image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )

    redirect_to twitter_accounts_path, notice: "Twitter account has been successfully connected."
  end

  private

  #helper method which contains a hash of information from omniauth about the user when sent to the callback url
  def auth_hash
    request.env['omniauth.auth']
  end
end
