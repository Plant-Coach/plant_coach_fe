require 'rails_helper'

RSpec.describe 'Create a new Plant Form' do
  before(:each) do
    visit '/'
    click_button "Log In"
    expect(current_path).to eq("/login")

    WebMock.allow_net_connect!
    fill_in :email, with: "joel@plantcoach.com"
    fill_in :password, with: "12345"
    click_button "Log In"
  end
  context 'As an authenticated user' do
    context 'when they click the button to Create a New Plant' do
      it 'takes them to a page to complete a form' do
        expect(current_path).to eq('/dashboard')

        click_button "Create a New Plant"

        expect(current_path).to eq('/plants/new')

        fill_in :plant_type, with: 'Pumpkin'
        fill_in :name, with: 'Atlantic Giant'
        fill_in :days_relative_to_frost_date, with: 14
        fill_in :days_to_maturity, with: 85
        fill_in :hybrid_status, with: 1
        click_button "Create Plant"

        expect(current_page).to eq("/plants")

        expect(page).to have_content("Atlantic Giant")
      end
    end
  end
end
