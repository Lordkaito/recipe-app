# frozen_string_literal: true

class AddUserToFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :user, null: false, foreign_key: true
  end
end
