class DashboardController < ApplicationController
  def index
    session[:user_id]
    session[:auth]
  end
end
