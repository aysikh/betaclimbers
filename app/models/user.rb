class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: {case_sensitive: false, message: " must be unique."}
  validates :password, presence: true

  

  


end
