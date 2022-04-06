class PlantsController < ApplicationController
  def index
    if !session[:auth].nil?
      @plants = PlantFacade.all_plants(session[:auth])
    else
      redirect_to '/', "Please log in."
    end
  end

  def new

  end

  def create
    if !session[:auth].nil?
      result = PlantService.create_plants(plant_params, session[:auth])
      redirect_to '/plants'
    else
      redirect_to '/', notice: "Please log in."
    end
  end

  private
  def plant_params
    params.permit(
      :plant_type,
      :name,
      :days_relative_to_frost_date,
      :days_to_maturity,
      :hybrid_status
    )
  end
end
