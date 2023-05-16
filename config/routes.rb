Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', as: 'about'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  resources :books, only: [:new, :index, :show, :create]
  end
