class User < ApplicationRecord
  has_secure_password

  def self.authenticate email, password
    user = find_by email: email
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
