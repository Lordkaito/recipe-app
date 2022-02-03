class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :foods

  def recipes_from_user
    recipes.order(created_at: :desc)
  end
end
