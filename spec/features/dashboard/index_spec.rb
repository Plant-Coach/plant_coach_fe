require 'rails_helper'

RSpec.describe 'User Dashboard' do
  context 'when I try to visit the /dashboard uri as a visitor' do
    it 'redirects me to the welcome page and asks me to log in' do
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content("You must log in!")
    end
  end

  context 'When I visit the dashboard as an authenticated user' do
    it 'shows me my name and email' do
      visit '/'
      click_button "Log In"
      expect(current_path).to eq("/login")

      WebMock.allow_net_connect!
      fill_in :email, with: "joel@plantcoach.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      expect(current_path).to eq('/dashboard')

      expect(page).to have_content("Joel Grant's Dashboard")
      expect(page).to have_content("Name: Joel Grant")
      expect(page).to have_content("Email: joel@plantcoach.com")
    end

    it 'shows the plants in the users garden' do
      visit '/'
      click_button "Log In"
      expect(current_path).to eq("/login")

      WebMock.allow_net_connect!
      fill_in :email, with: "joel@plantcoach.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      expect(current_path).to eq('/dashboard')

      # require 'pry'; binding.pry
      expect(page).to have_content("Joel Grant's Plants")
    end
  end
end
