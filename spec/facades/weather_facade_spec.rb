require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '::get_forecast' do
    it 'returns the forecast data for the location' do
      zip_code = 80122
      response = File.read("spec/fixtures/get_forecast.json")
      stub_request(:post, "https://stormy-chamber-46446.herokuapp.com/api/v1/forecast").
         with(
           body: {"location"=>"80122"},
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/x-www-form-urlencoded',
       	  'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: response, headers: {})
      data = WeatherFacade.get_forecast(80122)
      expect(data).to be_an Array
      data.each do |forecast|
        expect(forecast).to be_a Forecast
      end
    end
  end
end
