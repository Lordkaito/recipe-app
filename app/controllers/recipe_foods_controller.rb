class RecipeFoodsController < ApplicationController
  def index
    @foods = @user.foods
    p 'test'
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    if @recipe_food.save
      flash[:notice] = 'The food has been added.'
      redirect_to [@recipe.user, @recipe]
    else
      redirect_to [@recipe.user, @recipe]
      flash[:alert] = 'Sorry, we failed to add this food'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to [@recipe.user, @recipe], notice: 'Ingredient was successfully deleted.' }
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
