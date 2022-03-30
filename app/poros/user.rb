class User
  attr_reader :id, :name, :email, :zip_code
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
    @zip_code = data[:zip_code]
  end
end
