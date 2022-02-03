class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes_from_user
    @foods = @user.foods

    total_cost_of_recipe(@recipes)
    total_items_for_recipe(@recipes)
  end

  def total_cost_of_recipe(recipes)
    0 unless recipes.any?
    @total_cost = 0
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        @total_cost += recipe_food.food.price * recipe_food.quantity
      end
    end
    @total_cost
  end

  def total_items_for_recipe(recipes)
    0 unless recipes.any?
    @total_items = 0
    recipes.each do |recipe|
      @total_items += recipe.recipe_foods.count
    end
    @total_items
  end
end
