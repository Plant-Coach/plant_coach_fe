class UsersFacade
  def self.create_new_user(user_data)
    result = UsersService.create_new_user(user_data)
    user_poro = User.new(result[:data][:attributes])
  end
end
