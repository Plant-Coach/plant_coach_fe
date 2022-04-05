class UsersController < ApplicationController
  def new

  end

  def create
    user = UsersFacade.create_new_user(user_params.to_h)
    if user[:user]
      session[:user_id] = user[:user][:data][:id]
      session[:auth] = user[:jwt]
      session[:user_data] = user[:user][:data][:attributes]
      flash[:message] = "Your account has been created!  Welcome to Grants Plants, home of Plant Coach!"
      redirect_to dashboard_index_path # (user: user[:user][:data][:attributes][:name], email: user[:user][:data][:attributes][:email])
    elsif user[:error]
      flash[:message] = user[:error]
      redirect_to "/users/new"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :zip_code, :password, :password_confirmation)
  end
end
