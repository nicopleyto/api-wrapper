Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'home/main'
  get "/auth/twitter/callback", to: "omniauth_callbacks#connect_twitter"
  root 'home#main'
  
  get 'stalked_accounts/stalk_info'
  get 'stalked_accounts/stalk_user'
  resources :twitter_accounts
  resources :tweets
end
