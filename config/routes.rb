# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#welcome'

  resources :posts, only: [:index] do
    get 'search', on: :collection
  end
end
