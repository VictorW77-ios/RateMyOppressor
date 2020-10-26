class Review < ApplicationRecord
  belongs_to :user
  belongs_to :officer

  validates :title, :content, presence: true
  validates :officer, uniqueness: {scope: :user_id, message: "You can only leave one (1) review for this officer."}
end
