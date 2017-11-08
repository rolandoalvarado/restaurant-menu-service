# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  namespace :files do
    resources :csv do
      collection { post :import }
      collection { post :export }
    end
  end

  resources :menus
end
