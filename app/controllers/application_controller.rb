class ApplicationController < ActionController::Base
Rails.application.routes.draw do
    devise_for :users
    root 'songs#index'
  
    resources :users, only: [:show, :index, :edit, :update]  # ユーザー関連のルーティングを一つにまとめる
  
    resources :songs do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :edit, :update, :destroy]  # 必要に応じてdestroyを追加
    end
  end
end
