class UserPlantsController < ApplicationController
  def create
    plant = PlantFacade.create_user_plants(params[:plant_id], session[:auth])
    flash[:message] = "#{plant.name} #{plant.plant_type} has been added to your garden!"
    redirect_to '/plants'
  end

  def destroy
    if session[:auth] != nil
      result = PlantFacade.destroy_user_plant(params[:id], session[:auth])
      flash[:message] = "Plant removed!"
      redirect_to "/dashboard"
    else
      flash[:message] = "Please log in!"
      redirect_to "/"
    end
  end
end
