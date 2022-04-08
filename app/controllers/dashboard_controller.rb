class DashboardController < ApplicationController
  def index
    if session[:user_id] != nil && session[:auth] != nil
      @user = session[:user_data]
      @user_plants = PlantFacade.all_user_plants(session[:auth])
      # Get basic user information
      # Get a user's plant information
      # Get a user's frost date information
    else
      redirect_to '/', notice: "You must log in!"
    end
  end
end
