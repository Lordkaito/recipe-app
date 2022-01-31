Rails.application.routes.draw do
  root "users#index"
  devise_for :users
  resources :users, only: [:index] do
    resources :foods, only: [:index, :create, :destroy]
    resources :recipes, only: [:index, :show, :create, :destroy, :public_recipes] do
      # resources :recipe_foods, only: [:index, :destroy]
    end
  end
end
