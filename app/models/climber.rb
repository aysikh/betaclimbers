class Climber < ApplicationRecord
  has_many :projects
  has_many :routes, through: :projects
  has_many :memberships
  has_many :communities, through: :memberships
end
