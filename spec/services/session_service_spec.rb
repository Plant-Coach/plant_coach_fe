require 'rails_helper'

RSpec.describe SessionService do
  describe '::user_login' do
    it 'sends the users login data as an authenticated call' do
      WebMock.allow_net_connect!
      login_params = { email: 'joel@plantcoach.com', password: '12345' }
      login_response = SessionService.user_login(login_params)

      expect(login_response).to be_a Hash
      expect(login_response).to have_key(:user)

      expect(login_response).to have_key(:jwt)
      expect(login_response[:jwt]).to be_a String

      expect(login_response[:user]).to be_a Hash
      expect(login_response[:user]).to have_key(:data)

      expect(login_response[:user][:data]).to be_a Hash

      expect(login_response[:user][:data]).to have_key(:id)
      expect(login_response[:user][:data][:id]).to be_a String

      expect(login_response[:user][:data]).to have_key(:type)
      expect(login_response[:user][:data][:type]).to be_a String
      expect(login_response[:user][:data][:type]).to eq("sessions")
    end
  end
end
