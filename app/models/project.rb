class Project < ApplicationRecord
  belongs_to :climber
  belongs_to :route
end
