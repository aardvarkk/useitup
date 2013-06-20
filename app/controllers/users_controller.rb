class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @available = current_user.available_ingredients.includes(:ingredient)
    @pantry = current_user.pantry_ingredients.includes(:ingredient)
  end

end
