class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: {case_sensitive: false, message: " must be unique."}
  validates :password, presence: true

  

  def get_current_events
    sample_climbers = []
    while sample_climbers.count < 3
      Cimber.all.each do |climber|
        if climber.routes.any?
          sample_climbers.push(climber)
        end
      end
    end
    return sample_climbers
  end


end
