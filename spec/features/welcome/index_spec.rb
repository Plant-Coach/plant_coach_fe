require 'rails_helper'

RSpec.describe 'Welcome Page' do
  context "As a visitor" do
    context "when I visit the home page" do
      it "loads" do
        visit '/'
        expect(current_path).to eq("/")
      end

      it 'only shows the option to create a user or log in' do
        visit root_path

        expect(page).to_not have_button("Go to My Dashboard")
        expect(page).to have_link("Create a User")
        expect(page).to have_link("Log In")
      end

      it 'has a button to create an account' do
        visit root_path

        click_link "Create a User"
        expect(current_path).to eq("/users/new")
      end

      it 'has a login button' do
        visit root_path

        click_link "Log In"
        expect(current_path).to eq("/login")

        WebMock.allow_net_connect!
        fill_in :email, with: "joel@plantcoach.com"
        fill_in :password, with: "12345"
        click_button "Log In"
      end

      it 'shows a button to go to my dashboard when logged in' do
        visit root_path

        click_link "Log In"
        expect(current_path).to eq("/login")

        WebMock.allow_net_connect!
        fill_in :email, with: "joel@plantcoach.com"
        fill_in :password, with: "12345"
        click_button "Log In"

        visit '/'

        expect(page).to have_link("Go to My Dashboard")
        expect(page).to_not have_link("Create a User")
        expect(page).to_not have_link("Log In")

        click_link "Go to My Dashboard"

        expect(current_path).to eq("/dashboard")
      end

      it 'has a button to log out' do
        visit root_path

        click_link "Log In"
        expect(current_path).to eq("/login")

        WebMock.allow_net_connect!
        fill_in :email, with: "joel@plantcoach.com"
        fill_in :password, with: "12345"
        click_button "Log In"

        visit '/'

        expect(page).to have_button("Log Out")
        click_button "Log Out"

        expect(current_path).to eq("/")
        expect(page).to have_content("You have been successfully logged out.")

        expect(page).to have_link("Log In")
        expect(page).to have_link("Create a User")
        expect(page).to_not have_button("Log Out")
      end
    end
  end
end
