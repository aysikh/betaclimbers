class Route < ApplicationRecord
  belongs_to :location
  has_many :projects
  has_many :climbers, through: :projects

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :difficulty, presence: true
  validates :style, presence: true

  def add_like
    self.likes += 1
    self.save
  end

end
