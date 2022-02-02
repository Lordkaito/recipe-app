class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:user).includes(recipe_foods: [:food]).where(public: true)
  end
end
