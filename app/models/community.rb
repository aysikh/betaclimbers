class Community < ApplicationRecord
  has_many :posts
  has_many :climbers, through: :posts
end
