Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  get 'about', to: 'homes#about'

  resources :users, only: [:mypage, :show, :edit, :update, :destroy]
  resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy]
end
