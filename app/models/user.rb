class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :foods

  def all_food_for_user
    # ordered by name
    foods.order(:name)
  end

  def all_food_by_price
    # ordered by price
    foods.order(:price)
  end
end
