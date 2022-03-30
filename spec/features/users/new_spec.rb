require 'rails_helper'

RSpec.describe 'New Users Form' do
  describe 'when I arrive at the page to create a user' do
    it 'has field for my to create a new user' do
      visit '/'

      click_button "Create a User"
      expect(current_path).to eq("/users/new")

      fill_in :name, with: "Joel"
      fill_in :email, with: "test@email.com"
      fill_in :zip_code, with: "80000"
      fill_in :password, with: "12345"
      fill_in :password_confirmation, with: "12345"
      click_button "Create Account"
    end
  end
end
