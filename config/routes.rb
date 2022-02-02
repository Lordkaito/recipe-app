Rails.application.routes.draw do
  root "users#index"
  devise_for :users
  resources :users, only: [:index] do
    resources :foods, only: [:index, :create, :destroy]
    resources :recipes, only: [:index, :show, :create, :destroy] do
      resources :recipe_foods, only: [:create, :destroy]
    end
  end
  resources :public_recipes, only: [:index]
  resources :recipes, only: [:index] do
    resources :recipe_foods, only: [:create, :destroy]
  end
end
