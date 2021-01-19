class Review < ApplicationRecord
  belongs_to :user
  belongs_to :officer

  validates :title, :content, presence: true 

  scope :alpha, -> { order(:title) }
end
