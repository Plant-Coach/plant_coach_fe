class UsersController < ApplicationController
  def new

  end

  def create
    user = UsersFacade.create_new_user(user_params.to_h)
    session[:user_id] = user.id
    # Try to refactor this below:
    redirect_to dashboard_url controller: 'dashboard', action: 'index'#, controller: 'dashboard', action: 'index')
  end

  private

  def user_params
    params.permit(:name, :email, :zip_code, :password, :password_confirmation)
  end
end
