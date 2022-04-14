class FrostDateService
  def self.get_frost_dates(jwt)
    conn = Faraday.new(
      url: "https://stormy-chamber-46446.herokuapp.com",
      headers: { Authorization: "Bearer: #{jwt}" }
    )
    response = conn.get("/api/v1/frost_dates")
    JSON.parse(response.body, symbolize_names: true)
  end
end
