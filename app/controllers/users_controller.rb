class UsersController < ApplicationController
  def new

  end

  def create
    
  end

  private

  def user_params
    params.permit(:name, :email, :zip_code, :password, :password_confirmation)
  end
end
