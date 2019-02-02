class User < ApplicationRecord

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user && user.password == password ? user : nil
  end
end
