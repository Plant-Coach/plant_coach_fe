require 'rails_helper'

RSpec.describe UsersService do
  describe '::create_new_user' do
    it 'creates a new user in the database and returns the users id' do
      # user = {
      #   name: 'Joel Grant',
      #   email: 'joel1@test.com',
      #   zip_code: '80000',
      #   password: '12345',
      #   password_confirmation: '12345'
      # }
      # new_user = UsersService.create_new_user(user)
      #
      # expect(new_user).to be_a Hash
      # expect(new_user[:data]).to be_a Hash
      # expect(new_user[:data]).to have_key(:id)
      # expect(new_user[:data]).to have_key(:type)
      # expect(new_user[:data]).to have_key(:attributes)
      # expect(new_user[:data][:attributes]).to have_key(:id)
      # expect(new_user[:data][:attributes]).to have_key(:name)
      # expect(new_user[:data][:attributes]).to have_key(:email)
      # expect(new_user[:data][:attributes]).to have_key(:zip_code)
      # require 'pry'; binding.pry
    end
  end
end
