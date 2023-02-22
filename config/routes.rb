# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#welcome'

  resources :posts, only: [:index, :show] do
    get 'search', on: :collection
  end
end
