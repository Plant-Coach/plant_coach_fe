class PlantService
  def self.get_a_users_plants(jwt)
    conn = Faraday.new(
      url: "https://stormy-chamber-46446.herokuapp.com",
      headers: { Authorization: "Bearer: #{jwt}" }
    )
    response = conn.get("/api/v1/user_plants")
    JSON.parse(response.body, symbolize_names: true)
  end
end
