Rails.application.routes.draw do

  root 'static_pages#home'
  get 'sessions/new'
  get 'static_pages/mypage'
  get 'static_pages/about'
  get 'static_pages/profile'
  get 'static_pages/sample'
  get '/signup', to:'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/sample', to: 'static_pages#sample'
  
  # 飲食店を検索するためのroute
  get '/restaurants/home'
  get '/restaurants/list', to:'restaurants#list'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
      
  resources :microposts, only: [:create, :destroy, :new]
  resources :relationships,   only: [:create, :destroy]
  resources :searches, only: [:new, :index]
end
