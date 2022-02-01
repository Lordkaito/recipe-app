# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Recipe, user_id: user.id
    can :create, Recipe
  end
end
