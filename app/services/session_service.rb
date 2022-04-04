class SessionService
  def self.user_login(user_login_data)
    conn = Faraday.new(url: "https://stormy-chamber-46446.herokuapp.com",
      params: user_login_data
    )
    response = conn.post("/api/v1/sessions")
    JSON.parse(response.body, symbolize_names: true)
  end
end
