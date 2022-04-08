class UserPlantsController < ApplicationController
  def create
    plant = PlantFacade.create_user_plants(params[:plant_id], session[:auth])
    flash[:message] = "#{plant.name} #{plant.plant_type} has been added to your garden!"
    redirect_to '/plants'
  end
end
