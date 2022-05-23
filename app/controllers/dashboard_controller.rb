class DashboardController < ApplicationController
  def index
    if session[:auth] != nil
      @user = UsersFacade.user_data(session[:auth])
      @user_plants = PlantFacade.all_user_plants(session[:auth])
      @weekly_forecast = WeatherFacade.get_forecast(session[:auth])
      @frost_data = FrostDateFacade.get_frost_dates(session[:auth])
      # Get basic user information
      # Get a user's plant information
      # Get a user's frost date information
    else
      redirect_to '/', notice: "You must log in!"
    end
  end
end
