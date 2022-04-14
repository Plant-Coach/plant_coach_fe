require 'rails_helper'

RSpec.describe FrostDateService do
  describe '::get_frost_dates' do
    it 'returns the frost date data for the user' do
      WebMock.allow_net_connect!
      login_params = { email: 'joel@plantcoach.com', password: '12345' }
      login_response = SessionService.user_login(login_params)
      frost_date_data = FrostDateService.get_frost_dates(login_response[:jwt])
      require 'pry'; binding.pry
    end
  end
end
