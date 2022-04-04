class SessionsController < ApplicationController
  def new
  end
  def create
    user_data = SessionFacade.user_login(session_params)
    session[:user_id] = user_data[:user][:data][:id]
    session[:auth] = user_data[:jwt]
    redirect_to controller: 'dashboard', action: 'index'
  end

  private

  def session_params
    params.permit(:email, :password)
  end

end