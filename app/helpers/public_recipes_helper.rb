module PublicRecipesHelper
  def get_food_sum(public_recipe)
    recipe_foods = public_recipe.recipe_foods
    count = 0
    recipe_foods.each do |f|
      count += f.quantity * f.food.price
    end
    count
  end
end
