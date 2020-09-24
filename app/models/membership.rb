class Membership < ApplicationRecord
  belongs_to :climber
  belongs_to :community
end
