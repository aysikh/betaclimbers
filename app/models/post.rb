class Post < ApplicationRecord
  belongs_to :climber
  belongs_to :community
  has_many :comments

  validates :subject, presence: true
  validates :content, presence: true
  
end
