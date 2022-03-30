class UsersService
  def self.create_new_user(user_data)
    conn = Faraday.new("https://stormy-chamber-46446.herokuapp.com")
    response = conn.post("/api/v1/users") do |req|
      req.body = user_data
    end
    result = JSON.parse(response.body, symbolize_names: true)
  end
end
