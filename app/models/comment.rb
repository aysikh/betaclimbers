class Comment < ApplicationRecord
  belongs_to :climber
  belongs_to :post

  validates :message, presence: true
end
