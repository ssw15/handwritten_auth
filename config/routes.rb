Rails.application.routes.draw do
  resources :posts

  root 'users#index'

  resource :session, :only => [:new, :create, :destroy]

  resources :users

  get '/facebook/callback' => 'auth#facebook'
end
