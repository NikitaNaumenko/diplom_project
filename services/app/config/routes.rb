# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    get 'login', to: 'sessions#new', as: 'login'
    delete 'logout', to: 'sessions#destroy', as: 'logout'
    root 'users#index'

    resources :sessions, only: %i[new create destroy]
    resources :accounts, only: %i[new create]
    resources :users do
      scope module: :users do
        resources :family_members
      end
    end
    namespace :integrations do
      # resources :moi_krug
      namespace :moi_krug do
        resources :vacancies
      end
    end
    resources :settings, only: :index
    namespace :settings do
      namespace :catalogs do
        resources :skills
        resources :educations
        resources :positions
        resources :departments
      end

      namespace :integrations do
        resources :moi_krug, except: :show
        namespace :moi_krug do
          get :ping
          resource :auth, only: :show
          resources :callback_urls, only: :index
        end
      end
    end
  end
end
