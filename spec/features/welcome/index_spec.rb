require 'rails_helper'

RSpec.describe 'Welcome Page' do
  context "As a visitor" do
    context "when I visit the home page" do
      it "loads" do
        visit '/'
        expect(current_path).to eq("/")
      end

      it 'has a button to go to the plant coach app' do
        visit root_path

        click_link "Go to Plant Coach"
        expect(current_path).to eq("/plantcoach")
      end

      it 'has a button to create an account' do
        visit root_path

        click_button "Create a User"
        expect(current_path).to eq("/users/new")
      end

      it 'has a login button' do
        visit root_path

        click_button "Log In"
        expect(current_path).to eq("/login")

      #   body = {
      #   name: 'Joel Grant',
      #   email: 'joel@plantcoach.com',
      #   zip_code: '80121',
      #   password: '12345',
      #   password_confirmation: '12345'
      # }
      # post '/api/v1/users', params: body
      # result = JSON.parse(response.body, symbolize_names: true)
      #
      #   user = {
      #     name: 'Joel Grant',
      #     email: 'joelabcde@test.com',
      #     zip_code: '80000',
      #     password: '12345',
      #     password_confirmation: '12345'
      #   }
      #   response = File.read("spec/fixtures/create_user.json")
      #   # post '/api/v1/user',
      #   stub_request(:post, "https://stormy-chamber-46446.herokuapp.com/api/v1/users").
      #      with(
      #        body: {"email"=>"joelabcde@test.com", "name"=>"Joel Grant", "password"=>"12345", "password_confirmation"=>"12345", "zip_code"=>"80000"},
      #        headers: {
      #    	  'Accept'=>'*/*',
      #    	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #    	  'Content-Type'=>'application/x-www-form-urlencoded',
      #    	  'User-Agent'=>'Faraday v2.2.0'
      #        }).
      #      to_return(status: 200, body: response, headers: {})
      #
      #   new_user = UsersService.create_new_user(user)
        WebMock.allow_net_connect!
        fill_in :email, with: "joel@plantcoach.com"
        fill_in :password, with: "12345"
        click_button "Log In"
      end
    end
  end
end
