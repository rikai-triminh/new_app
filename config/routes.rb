Rails.application.routes.draw do
  root              'static_pages#home'
  
  get '/help',      to: 'static_pages#help'
  get '/about',     to: 'static_pages#about'
  get '/contact',   to: 'static_pages#contact'
  get '/show',      to: 'static_pages#show'
  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 # get 'password_resets/new'
 # get 'password_resets/edit'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i(new create edit update)
  resources :microposts,          only: [:create, :destroy, :show]
  resources :relationships,       only: [:create, :destroy]
  resources :comments,            only: [:create, :destroy, :show, :new]
end
