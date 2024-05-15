Rails.application.routes.draw do
  devise_for :users
  
  root 'songs#index'
  
  resources :users, only: [:index, :show, :edit, :update]
  
  resources :songs do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update]
    get '/songs', to: 'songs#index', as: 'songs_list'
    
  end
end

