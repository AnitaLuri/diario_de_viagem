# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#welcome'

  resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments, only: [:create]
    get 'search', on: :collection
  end

  resources :profiles, only: [:index, :show]

 
end
