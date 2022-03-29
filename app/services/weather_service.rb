class WeatherService
  def self.get_weather(zip_code)
    conn = Faraday.new("https://stormy-chamber-46446.herokuapp.com/")
    response = conn.post("/api/v1/forecast") do |req|
      req.body = { location: zip_code }
    end

    result = JSON.parse(response.body, symbolize_names: true)
  end
end
