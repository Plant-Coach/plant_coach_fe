class SessionFacade
  def self.user_login(user_login_data)
    login_response = SessionService.user_login(user_login_data)
  end
end
