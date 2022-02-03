class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def new
    @user = current_user
    @food = Food.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @food = current_user.foods.new(food_params)

    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Food was successfully created.'
          redirect_to user_foods_path
        else
          flash[:error] = 'Food was not created.'
          render :new
        end
      end
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path(current_user.id), notice: 'Food was successfully deleted.'
  end
end
