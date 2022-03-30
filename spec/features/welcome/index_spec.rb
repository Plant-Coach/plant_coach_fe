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
        expect(current_path).to eq(dashboard_path(subdomain: 'plantcoach'))
      end

      it 'has a button to create an account' do
        visit root_path

        click_button "Create a User"
        expect(current_path).to eq("/users/new")
      end
    end
  end
end
