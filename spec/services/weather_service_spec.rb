require 'rails_helper'

RSpec.describe WeatherService do
  describe '::get_weather' do
    it 'retrieves the weather data based on the users zip code' do
      # WebMock.allow_net_connect!
      user = {
        name: 'Joel Grant',
        email: 'joel123456@test.com',
        zip_code: '80125',
        password: '12345',
        password_confirmation: '12345'
      }
      response = File.read("spec/fixtures/create_user.json")
      stub_request(:post, "https://stormy-chamber-46446.herokuapp.com/api/v1/users").
         with(
           body: {"email"=>"joel123456@test.com", "name"=>"Joel Grant", "password"=>"12345", "password_confirmation"=>"12345", "zip_code"=>"80125"},
           headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Content-Type'=>'application/x-www-form-urlencoded',
              'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: response, headers: {})
         
      authenticated_user = UsersService.create_new_user(user)
      if authenticated_user[:error] == "This user already exists!!"
        login_params = { email: 'joel123456@test.com', password: '12345' }
        authenticated_user = SessionService.user_login(login_params)
      end

      forecast = File.read("spec/fixtures/get_forecast.json")
      stub_request(:get, "https://stormy-chamber-46446.herokuapp.com/api/v1/forecast").
         with(
           headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.0NAXbbVzeMaKZAl8HdOq3JcgIDf5xpGF2rkg5frw6FE',
              'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: forecast, headers: {})
      data = WeatherService.get_weather(authenticated_user[:jwt])

      expect(data).to be_a Hash
      expect(data[:data]).to be_an Array
      expect(data[:data][0][:attributes]).to be_a Hash
    end
  end
end
