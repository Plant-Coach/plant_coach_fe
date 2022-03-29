require 'rails_helper'

RSpec.describe 'Welcome Page' do
  context "As a visitor" do
    context "when I visit the home page" do
      it "loads" do
        visit '/'
        expect(current_path).to eq("/")
      end
    end
  end
end
