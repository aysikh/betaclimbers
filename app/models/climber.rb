class Climber < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :routes, through: :projects
  has_many :memberships
  has_many :communities, through: :memberships

  validates :username, uniqueness: {case_sensitive: false, message: " must be unique."}
  
end
