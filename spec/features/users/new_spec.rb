require 'rails_helper'

RSpec.describe 'New Users Form' do
  describe 'when I arrive at the page to create a user' do
    it 'has field for my to create a new user' do
      visit '/'

      click_button "Create a User"
      expect(current_path).to eq("/users/new")

      response = File.read("spec/fixtures/create_user.json")
      stub_request(:post, "https://stormy-chamber-46446.herokuapp.com/api/v1/users").
         with(
           body: {"email"=>"test@email.com", "name"=>"Joel", "password"=>"12345", "password_confirmation"=>"12345", "zip_code"=>"80000"},
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/x-www-form-urlencoded',
       	  'User-Agent'=>'Faraday v2.2.0'
           }).
         to_return(status: 200, body: response, headers: {})

      fill_in :name, with: "Joel"
      fill_in :email, with: "test@email.com"
      fill_in :zip_code, with: "80000"
      fill_in :password, with: "12345"
      fill_in :password_confirmation, with: "12345"
      click_button "Create Account"

      expect(current_path).to eq("/plantcoach")
    end
  end
end
