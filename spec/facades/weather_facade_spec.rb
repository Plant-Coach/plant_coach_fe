require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '::get_forecast' do
    it 'returns the forecast data for the location' do
      zip_code = 80122
      data = WeatherFacade.get_forecast(80112)
      expect(data).to be_an Array
      data.each do |forecast|
        expect(forecast).to be_a Forecast
      end
    end
  end
end
