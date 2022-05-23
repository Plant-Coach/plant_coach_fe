class UsersService
  def self.create_new_user(user_data)
    conn = Faraday.new("https://stormy-chamber-46446.herokuapp.com")
    response = conn.post("/api/v1/users") do |req|
      req.body = user_data
    end
    result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_data(jwt)
    conn = Faraday.new(url: "https://stormy-chamber-46446.herokuapp.com/",
      headers: { Authorization: "Bearer: #{jwt}" }
    )
    response = conn.get("/api/v1/users")
    JSON.parse(response.body, symbolize_names: true)
  end
end
