class PlantFacade
  def self.all_plants(jwt)
    plant_data = PlantService.all_plants(jwt)
    plants = plant_data[:data].map do |plant|
      Plant.new(plant)
    end
  end

  def self.all_user_plants(jwt)
    plant_data = PlantService.get_a_users_plants(jwt)
    plants = plant_data[:data].map do |plant|
      Plant.new(plant)
    end
  end

  def self.create_user_plants(plant_id, jwt)
    plant_data = PlantService.create_user_plants(plant_id, jwt)
    Plant.new(plant_data[:data])
  end

  def self.destroy_user_plant(plant_id, jwt)
    plant_data = PlantService.destroy_user_plant(plant_id, jwt)
    
  end
end
