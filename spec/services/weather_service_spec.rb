require 'rails_helper'

RSpec.describe WeatherService do
  describe '::get_weather' do
    it 'retrieves the weather data based on the users zip code' do
      zip_code = 80111
      data = WeatherService.get_weather(zip_code)

      expect(data).to be_a Hash
      expect(data[:data]).to be_an Array
      expect(data[:data][0][:attributes]).to be_a Hash
    end
  end
end
