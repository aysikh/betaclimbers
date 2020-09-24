class Route < ApplicationRecord
  belongs_to :location
  has_many :projects
  has_many :climbers, through: :projects
end
