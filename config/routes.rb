Rails.application.routes.draw do

  root 'static_pages#home'
  get 'sessions/new'
  get 'static_pages/mypage'
  get 'static_pages/about'
  get 'static_pages/profile'
  get 'static_pages/sample'
  get '/signup', to:'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/sample', to: 'static_pages#sample'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
      
  resources :microposts, only: [:create, :destroy, :new]
  resources :relationships,   only: [:create, :destroy]
  resources :searches, only: [:new, :index]
  resources :finds, only: [:new, :index]
end
