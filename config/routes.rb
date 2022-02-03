# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:index] do
    resources :shopping_list, only: [:index]
    resources :foods, only: [:index, :create, :new, :destroy]
    resources :recipes, only: [:index, :show, :create, :destroy] do
      resources :recipe_foods, only: [:create, :destroy]
    end
  end
  resources :public_recipes, only: [:index]
  resources :recipes, only: [:show] do
    resources :recipe_foods, only: [:create, :destroy]
  end
end
