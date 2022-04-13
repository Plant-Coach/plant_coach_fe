class WeatherFacade
  def self.get_forecast(jwt)
    forecast_data = WeatherService.get_weather(jwt)
    forecast = forecast_data[:data].map do |weather|
      Forecast.new(weather)
    end
  end
end
