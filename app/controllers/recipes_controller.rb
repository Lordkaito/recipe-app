class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user
    @recipes = @user.recipes
  end
  
  def show
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = 'Your recipe has been created.'
      redirect_to [@recipe.user, @recipe]
    else
      redirect_to [:new_user_recipe]
      flash[:alert] = 'Sorry, we failed to create your recipe'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    puts 'test'
    recipe.destroy
    respond_to do |format|
      format.html { redirect_to [current_user, :recipes], notice: 'Recipe was successfully deleted.' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
