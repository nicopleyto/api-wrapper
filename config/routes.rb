Rails.application.routes.draw do
  devise_for :users
  get 'home/main'
  get "/auth/twitter/callback", to: "omniauth_callbacks#connect_twitter"
  root 'home#main'
  resources :twitter_accounts
end
