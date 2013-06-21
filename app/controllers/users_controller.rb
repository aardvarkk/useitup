class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @available = current_user.available_ingredients
    @pantry = current_user.pantry_ingredients
  end

end
