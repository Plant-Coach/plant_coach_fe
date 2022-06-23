require 'rails_helper'

RSpec.describe 'New Users Form' do
  describe 'when I arrive at the page to create a user' do
    it 'has field for my to create a new user' do
      WebMock.allow_net_connect!
      visit '/'

      click_link "Create a User"
      expect(current_path).to eq("/users/new")

      # response = File.read("spec/fixtures/create_user.json")

      fill_in :name, with: "Joel Grant"
      fill_in :email, with: "test@email.com"
      fill_in :zip_code, with: "80125"
      fill_in :password, with: "12345"
      fill_in :password_confirmation, with: "12345"

      expect(page).to have_button("Create Account")
      # click_button "Create Account"

      # expect(current_path).to eq("/dashboard")
    end

    it 'will return an error if I fill out the creation form incorrectly' do
      visit "/users/new"
      WebMock.allow_net_connect!
      fill_in :name, with: "Joel"
      fill_in :email, with: "test1@email.com"
      fill_in :zip_code, with: "81250"
      fill_in :password, with: "BAD PASSWORD"
      fill_in :password_confirmation, with: "12345"
      click_button "Create Account"

      expect(current_path).to eq("/users/new")

      expect(page).to have_content("Your passwords must match!")
    end
  end
end
