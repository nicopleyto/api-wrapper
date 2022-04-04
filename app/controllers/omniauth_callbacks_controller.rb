class OmniauthCallbacksController < ApplicationController
  def connect_twitter
    render plain: "Success!"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
