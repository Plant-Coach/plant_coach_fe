require 'rails_helper'

RSpec.describe FrostDateService do
  describe '::get_frost_dates' do
    it 'returns the frost date data for the user' do
      WebMock.allow_net_connect!
      login_params = { email: 'joel@plantcoach.com', password: '12345' }
      login_response = SessionService.user_login(login_params)
      frost_date_data = FrostDateService.get_frost_dates(login_response[:jwt])

      expect(frost_date_data).to be_a Hash
      expect(frost_date_data[:data][:attributes]).to have_key(:id)
      expect(frost_date_data[:data][:attributes]).to have_key(:zip_code)
      expect(frost_date_data[:data][:attributes]).to have_key(:location_name)
      expect(frost_date_data[:data][:attributes]).to have_key(:lat)
      expect(frost_date_data[:data][:attributes]).to have_key(:lon)
      expect(frost_date_data[:data][:attributes]).to have_key(:spring_frost)
      expect(frost_date_data[:data][:attributes]).to have_key(:fall_frost)
    end
  end
end
