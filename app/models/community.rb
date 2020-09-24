class Community < ApplicationRecord
  has_many :memberships
  has_many :climbers, through: :memberships
end
