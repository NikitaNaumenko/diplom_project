# frozen_string_literal: true

Rails.application.routes.draw do
  # Production mode
  # namespace :api, defaults: { format: :json }, constraints: { protocol: /https/ } do

  # namespace :api, defaults: { format: :json }, constraints: { protocol: /http/ } do
  #   resources :accounts
  # end
  scope module: :api do
    resources :accounts
  end
end
