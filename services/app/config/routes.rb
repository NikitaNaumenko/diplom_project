# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    root 'users#index'

    resources :sessions, only: %i[new create destroy]
    resources :accounts, only: %i[new create]
    resources :users
    resources :moi_krugs, except: :show
    namespace :moi_krugs do
      resources :pings, only: :index
      resources :auth_urls, only: :create
      resources :callback_urls, only: :index
    end
    namespace :settings do
      resources :skills
    end
  end
end
