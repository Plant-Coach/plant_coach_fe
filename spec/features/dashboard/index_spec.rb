require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  context 'when I visit my user dashboard' do
    it 'loads' do
      Capybara.default_host = 'http://plantcoach.myappname.dev'
      visit dashboard_path(subdomain: 'plantcoach')
      # visit '/plantcoach'
      expect(current_path).to eq(dashboard_path(subdomain: 'plantcoach'))
      # expect(current_path).to eq('/plantcoach/dashboard')
    end
  end
end
