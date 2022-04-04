class OmniauthCallbacksController < ApplicationController
  def connect_twitter
    render plain: "Success!"
    byebug
  end

  private

  #helper method from omniauth which contains a hash of information about the user when sent to the callback url
  def auth_hash
    request.env['omniauth.auth']
  end
end
