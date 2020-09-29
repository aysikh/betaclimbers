class Climber < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :routes, through: :projects
  has_many :memberships
  has_many :communities, through: :memberships

  # validates :username, presence: true, uniqueness: {case_sensitive: false, message: " must be unique."}
  # validates :password, presence: true
  # validates :name, presence: true, uniqueness: {case_sensitive: false}
  # validates :experience, presence: true
  # validates :birthyear, presence: true
  # validates :bio, presence: true, length: {minimum: 100}
  # validates :height, presence: true 
  # validates :weight, presence: true
  # validates :origin, presence: true
  # validates :preference, presence: true
  # validates :profile_pic, presence: true
  
end
