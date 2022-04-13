class WeatherService
  def self.get_weather(jwt)
    conn = Faraday.new(url: "https://stormy-chamber-46446.herokuapp.com/",
      headers: { Authorization: "Bearer: #{jwt}" }
    )
    response = conn.get("/api/v1/forecast")

    result = JSON.parse(response.body, symbolize_names: true)
  end
end
