class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
  end
  
  def show
  end

  def create
  end

  def public_recipes
  end

  def destroy
    recipe = Recipe.find(params[:id])
    puts 'test'
    recipe.destroy
    respond_to do |format|
      format.html { redirect_to [current_user, :recipes], notice: 'Recipe was successfully deleted.' }
    end
  end
end
