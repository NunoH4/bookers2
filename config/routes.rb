Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', as: 'about'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  resources :books, only: [:new, :index, :show, :create]
  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:show, :edit, :index]
  end
