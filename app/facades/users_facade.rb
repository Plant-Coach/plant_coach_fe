class UsersFacade
  def self.create_new_user(user_data)
    result = UsersService.create_new_user(user_data)
    # There needs to be some error handling in case the email address is no good.
    # user_poro = User.new(result[:data][:attributes])
  end

  def self.user_data(jwt)
    user_data = UsersService.user_data(jwt)
    User.new(user_data[:data][:attributes])
  end
end
