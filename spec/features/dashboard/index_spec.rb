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

    xit 'show the plants that the user is going to plant' do
      visit '/'
      click_button "Log In"
      expect(current_path).to eq("/login")

      WebMock.allow_net_connect!
      fill_in :email, with: "joel@plantcoach.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Sungold Tomato")
      expect(page).to have_content("Jalafuego Pepper")
      expect(page).to have_content("Rosa Bianca Eggplant")
    end

    xit 'has a button to remove the plant from the users dashboard and planner' do
      visit '/'
      click_button "Log In"
      expect(current_path).to eq("/login")

      WebMock.allow_net_connect!
      fill_in :email, with: "joel@plantcoach.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      visit '/dashboard'

      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Sungold Tomato")
      expect(page).to have_content("Jalafuego Pepper")
      expect(page).to have_content("Rosa Bianca Eggplant")

      click_button "Remove Sungold Tomato"
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Plant removed!")
      expect(page).to_not have_content("Sungold Tomato")
      expect(page).to have_content("Jalafuego Pepper")
      expect(page).to have_content("Rosa Bianca Eggplant")

      click_button "Remove Jalafuego Pepper"
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Plant removed!")
      expect(page).to_not have_content("Sungold Tomato")
      expect(page).to_not have_content("Jalafuego Pepper")
      expect(page).to have_content("Rosa Bianca Eggplant")

      click_button "Remove Rosa Bianca Eggplant"
      expect(page).to have_content("Plant removed!")
      expect(current_path).to eq("/dashboard")
      expect(page).to_not have_content("Sungold Tomato")
      expect(page).to_not have_content("Jalafuego Pepper")
      expect(page).to_not have_content("Rosa Bianca Eggplant")
      # This is to re-add the plants to the users dashboard for other tests to pass
      visit '/plants'
      click_button "Add Sungold Tomato to my Garden"
      click_button "Add Jalafuego Pepper to my Garden"
      click_button "Add Rosa Bianca Eggplant to my Garden"
      click_button "Return to My Dashboard"
    end
  end
end
