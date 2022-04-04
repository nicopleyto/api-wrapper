Rails.application.routes.draw do
  devise_for :users
  get 'home/main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"
  root 'home#main'
end
