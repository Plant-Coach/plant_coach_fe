require 'rails_helper'

RSpec.describe 'Welcome Page' do
  context "As a visitor" do
    context "when I visit the home page" do
      it "loads" do
        visit '/'
        expect(current_path).to eq("/")
      end

      it 'has a button to go to the plant coach app' do
        visit root_path

        click_link "Go to Plant Coach"
        expect(current_path).to eq("/plantcoach")
      end

      it 'has a button to create an account' do
        visit root_path

        click_button "Create a User"
        expect(current_path).to eq("/users/new")
      end

      it 'has a login button' do
        visit root_path

        click_button "Log In"
        expect(current_path).to eq("/login")

        WebMock.allow_net_connect!
        fill_in :email, with: "joel@plantcoach.com"
        fill_in :password, with: "12345"
        click_button "Log In"
      end
    end
  end
end
