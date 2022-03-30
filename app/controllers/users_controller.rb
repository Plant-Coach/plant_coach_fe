class UsersController < ApplicationController
  def new

  end

  def create
    user = UsersFacade.create_new_user(user_params.to_h)
  end

  private

  def user_params
    params.permit(:name, :email, :zip_code, :password, :password_confirmation)
  end
end
