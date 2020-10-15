class Review < ApplicationRecord
  belongs_to :user
  belongs_to :officer

  validates :title, :description, presence: true
end
