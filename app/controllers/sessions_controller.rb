class SessionsController < ApplicationController
  def new
  end
  def create
    user_data = SessionFacade.user_login(session_params)
    if user_data[:error]
      flash[:message] = "Your credentials are incorrect!  Please create an account or log in!"
      redirect_to "/login"
    else
      session[:user_id] = user_data[:user][:data][:id]
      session[:auth] = user_data[:jwt]
      session[:user_data] = user_data[:user][:data][:attributes]
      redirect_to dashboard_index_path
    end
  end

  def destroy
    session.destroy
    flash[:message] = "You have been successfully logged out."
    redirect_to root_path
  end
  private

  def session_params
    params.permit(:email, :password)
  end

end
