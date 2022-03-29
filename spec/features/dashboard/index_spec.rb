require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  context 'when I visit my user dashboard' do
    it 'loads' do
      visit dashboard_path(:subdomain => 'plantCoach')
    end
  end
end
