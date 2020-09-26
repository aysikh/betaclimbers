class Location < ApplicationRecord
  has_many :routes



  def all_routes
    self.routes.map
  end
end
