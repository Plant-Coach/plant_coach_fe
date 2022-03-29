class WeatherFacade
  def self.get_forecast(zip_code)
    forecast_data = WeatherService.get_weather(zip_code)
    forecast = forecast_data[:data].map do |weather|
      Forecast.new(weather)
    end
  end
end
