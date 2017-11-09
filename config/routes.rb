# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  devise_scope :user do
    get '/users/sign_in' => 'devise/sessions#new', as: :signin
    get '/users/sign_out' => 'devise/sessions#destroy', as: :signout
  end

  namespace :files do
    resources :csv do
      collection { post :import }
      collection { get :export }
    end
  end

  resources :menus

  %w(404 422 500).each do |code|
    get code, to: 'errors#show', code: code
  end
  get '*unmatched_route', to: 'errors#show'
end
