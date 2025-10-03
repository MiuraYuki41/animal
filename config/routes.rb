Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  get 'about', to: 'homes#about'
  
  get 'mypage', to: "users#mypage"
  resources :users

  resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy]
end
