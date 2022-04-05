require 'rails_helper'

RSpec.describe 'User Dashboard' do
  context 'when I try to visit the /dashboard uri as a visitor' do
    it 'redirects me to the welcome page and asks me to log in' do
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content("You must log in!")
    end
  end
end
