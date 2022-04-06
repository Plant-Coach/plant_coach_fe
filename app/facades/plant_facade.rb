class PlantFacade
  def self.all_plants(jwt)
    plant_data = PlantService.all_plants(jwt)
    plants = plant_data[:data].map do |plant|
      Plant.new(plant)
    end
  end
end
