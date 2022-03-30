require 'rails_helper'

RSpec.describe UsersFacade do
  describe '::create_new_user' do
    it 'creates a new user from the form data and sends to service' do
      user = {
        name: 'Joel Grant',
        email: 'joel123490@test.com',
        zip_code: '80000',
        password: '12345',
        password_confirmation: '12345'
      }

      response = File.read("spec/fixtures/create_user.json")

      stub_request(:post, "https://stormy-chamber-46446.herokuapp.com/api/v1/users").
        with(
          body: {"email"=>"joel123490@test.com", "name"=>"Joel Grant", "password"=>"12345", "password_confirmation"=>"12345", "zip_code"=>"80000"},
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Content-Type'=>'application/x-www-form-urlencoded',
         'User-Agent'=>'Faraday v2.2.0'
          }).
        to_return(status: 200, body: response, headers: {})

      user_result = UsersFacade.create_new_user(user)

      expect(user_result).to be_a User
      expect(user_result.id).to be_an Integer
      expect(user_result.name).to be_a String
      expect(user_result.email).to be_a String
    end
  end
end
