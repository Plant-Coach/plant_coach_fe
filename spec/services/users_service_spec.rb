require 'rails_helper'

RSpec.describe UsersService do
  describe '::create_new_user' do
    it 'creates a new user in the database and returns the users id' do
      WebMock.allow_net_connect!
      user = {
        name: 'Joel Grant',
        email: 'joel123456@test.com',
        zip_code: '80000',
        password: '12345',
        password_confirmation: '12345'
      }
      # response = File.read("spec/fixtures/create_user.json")
      #
      # stub_request(:post, "https://stormy-chamber-46446.herokuapp.com/api/v1/users").
      #    with(
      #      body: {"email"=>"joel123456@test.com", "name"=>"Joel Grant", "password"=>"12345", "password_confirmation"=>"12345", "zip_code"=>"80000"},
      #      headers: {
      #  	  'Accept'=>'*/*',
      #  	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #  	  'Content-Type'=>'application/x-www-form-urlencoded',
      #  	  'User-Agent'=>'Faraday v2.2.0'
      #      }).
      #    to_return(status: 200, body: response, headers: {})
      new_user = UsersService.create_new_user(user)
      # require 'pry'; binding.pry
      expect(new_user).to be_a Hash
      expect(new_user[:user]).to be_a Hash
      expect(new_user[:user]).to have_key(:data)

      expect(new_user[:user][:data]).to be_a Hash
      expect(new_user[:user][:data]).to have_key(:id)
      expect(new_user[:user][:data]).to have_key(:type)
      expect(new_user[:user][:data]).to have_key(:attributes)
      expect(new_user[:user][:data][:attributes]).to have_key(:id)
      expect(new_user[:user][:data][:attributes]).to have_key(:name)
      expect(new_user[:user][:data][:attributes]).to have_key(:email)
      expect(new_user[:user][:data][:attributes]).to have_key(:zip_code)

      deletion_response = UsersService.delete_user(new_user[:user][:data][:id], new_user[:jwt])

      expect(deletion_response.status).to eq(204)
    end
  end

  describe '::user_data' do
    it 'retrieves the basic information of a user based on the JWT' do
      WebMock.allow_net_connect!
      login_params = { email: 'joel@plantcoach.com', password: '12345' }
      login_response = SessionService.user_login(login_params)

      expect(login_response).to be_a Hash
      expect(login_response).to have_key(:user)

      expect(login_response).to have_key(:jwt)

      result = UsersService.user_data(login_response[:jwt])

      expect(result).to be_a Hash
      expect(result).to be_a Hash
      expect(result).to have_key(:data)

      expect(result[:data]).to be_a Hash
      expect(result[:data]).to have_key(:id)
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:id)
      expect(result[:data][:attributes]).to have_key(:name)
      expect(result[:data][:attributes]).to have_key(:email)
      expect(result[:data][:attributes]).to have_key(:zip_code)
    end
  end
end
