require 'rails_helper'

RSpec.describe 'Plants Index Page' do
  before(:each) do
    visit '/'
    click_link "Log In"
    expect(current_path).to eq("/login")

    WebMock.allow_net_connect!
    fill_in :email, with: "joel@plantcoach.com"
    fill_in :password, with: "12345"
    click_button "Log In"

    expect(current_path).to eq("/dashboard")
    # visit '/plants'
  end
  context 'when I go to the plants index page and see the list of plants' do
    it 'has a button by each plant to add it to my garden' do
      visit '/plants'

      click_button "Add Toma Verde Tomatillo to my Garden"

      expect(page).to have_content("Toma Verde Tomatillo has been added to your garden!")

      expect(current_path).to eq("/plants")
    end

    it 'has a button to return to the user dashboard' do
      visit '/plants'

      click_button "Return to My Dashboard"

      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Joel Grant's Dashboard")
    end

    it 'has a button to add more plants from within the plant index' do
      visit '/plants'

      click_button "Create a New Plant"

      expect(current_path).to eq("/plants/new")

      fill_in :plant_type, with: 'Watermelon'
      fill_in :name, with: 'Sugar Baby'
      fill_in :days_relative_to_frost_date, with: 14
      fill_in :days_to_maturity, with: 89
      fill_in :hybrid_status, with: 1
      click_button "Create Plant"

      expect(current_path).to eq("/plants")

      expect(current_path).to eq("/plants")
    end
  end
end
