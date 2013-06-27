class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate(login, password)
  	user = User.find_by_login(login)
  	user if user.present? && user.authenticate(password)
  end
end