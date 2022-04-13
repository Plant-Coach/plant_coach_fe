require 'rails_helper'

RSpec.describe WeatherService do
  describe '::get_weather' do
    xit 'retrieves the weather data based on the users zip code' do
      zip_code = 80111
      response = File.read("spec/fixtures/get_forecast.json")
      stub_request(:post, "https://stormy-chamber-46446.herokuapp.com/api/v1/forecast").
         with(
           body: {"location"=>"80111"},
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/x-www-form-urlencoded',
       	  'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: response, headers: {})
      data = WeatherService.get_weather(zip_code)

      expect(data).to be_a Hash
      expect(data[:data]).to be_an Array
      expect(data[:data][0][:attributes]).to be_a Hash
    end
  end
end
