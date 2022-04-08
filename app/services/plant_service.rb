class PlantService
  def self.get_a_users_plants(jwt)
    conn = Faraday.new(
      url: "https://stormy-chamber-46446.herokuapp.com",
      headers: { Authorization: "Bearer: #{jwt}" }
    )
    response = conn.get("/api/v1/user_plants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_plants(plant_details, jwt)
    conn = Faraday.new(
      url: "https://stormy-chamber-46446.herokuapp.com",
      params: plant_details,
      headers: { Authorization: "Bearer #{jwt}" }
    )
    response = conn.post("/api/v1/plants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.all_plants(jwt)
    conn = Faraday.new(
      url: "https://stormy-chamber-46446.herokuapp.com",
      headers: { Authorization: "Bearer #{jwt}" }
    )
    response = conn.get("/api/v1/plants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user_plants(plant_id, jwt)
    conn = Faraday.new(
      url: "https://stormy-chamber-46446.herokuapp.com",
      params: { plant_id: plant_id },
      headers: { Authorization: "Bearer #{jwt}"}
    )
    response = conn.post("/api/v1/user_plants")
    JSON.parse(response.body, symbolize_names: true)
  end
end
