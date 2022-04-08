require 'rails_helper'

RSpec.describe PlantService do
  describe '::get_a_users_plants' do
    it 'returns the plants that a user has selected to plant' do
      WebMock.allow_net_connect!
      login_params = { email: 'joel@plantcoach.com', password: '12345' }
      login_response = SessionService.user_login(login_params)
      data = PlantService.get_a_users_plants(login_response[:jwt])

      expect(data[:data]).to be_an Array
      # Add more tests after functionality is made.
    end
  end

  describe '::create_plants' do
    it 'makes a plant in the plant database for the entire application' do
      login_params = { email: 'joel@plantcoach.com', password: '12345' }
      login_response = SessionService.user_login(login_params)

      plant_details = {
        plant_type: "Watermelon",
        name: "Sugar Baby",
        days_relative_to_frost_date: 7,
        days_to_maturity: 60,
        hybrid_status: 1
      }

      data = PlantService.create_plants(plant_details, login_response[:jwt])
      expect(data[:data]).to have_key(:id)
      expect(data[:data]).to have_key(:type)
      expect(data[:data]).to have_key(:attributes)

      expect(data[:data][:attributes]).to have_key(:plant_type)
      expect(data[:data][:attributes][:plant_type]).to be_a String

      expect(data[:data][:attributes]).to have_key(:name)
      expect(data[:data][:attributes][:name]).to be_a String

      expect(data[:data][:attributes]).to have_key(:days_relative_to_frost_date)
      expect(data[:data][:attributes][:days_relative_to_frost_date]).to be_an Integer

      expect(data[:data][:attributes]).to have_key(:days_to_maturity)
      expect(data[:data][:attributes][:days_to_maturity]).to be_an Integer

      expect(data[:data][:attributes]).to have_key(:hybrid_status)
      expect(data[:data][:attributes][:hybrid_status]).to be_an Integer
    end
  end
end
