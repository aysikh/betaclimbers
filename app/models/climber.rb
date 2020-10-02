class Climber < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :routes, through: :projects
  has_many :posts
  has_many :communities, through: :posts
  has_many :comments
  
  validates :username, uniqueness: {case_sensitive: false, message: " must be unique."}
  

  def delete_route(route_obj)
    @climber.routes.each do |route|
      if route == route_obj
        route.delete
      end
    end
  end


end
