require 'rails_helper'

RSpec.describe SessionFacade do
  describe '::user_login' do
    it 'sends visitor login data to the session service' do
      WebMock.allow_net_connect!

      login_params = { email: 'joel@plantcoach.com', password: '12345' }
      authenticated_user = SessionService.user_login(login_params)

      expect(authenticated_user).to be_a Hash
      expect(authenticated_user).to have_key(:user)

      expect(authenticated_user).to have_key(:jwt)
      expect(authenticated_user[:jwt]).to be_a String

      expect(authenticated_user[:user]).to be_a Hash
      expect(authenticated_user[:user]).to have_key(:data)

      expect(authenticated_user[:user][:data]).to be_a Hash

      expect(authenticated_user[:user][:data]).to have_key(:id)
      expect(authenticated_user[:user][:data][:id]).to be_a String

      expect(authenticated_user[:user][:data]).to have_key(:type)
      expect(authenticated_user[:user][:data][:type]).to be_a String
      expect(authenticated_user[:user][:data][:type]).to eq("sessions")
    end
  end
end
