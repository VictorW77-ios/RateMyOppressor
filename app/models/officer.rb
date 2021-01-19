class Officer < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews 
    
    def self.most_reviewed 
        joins(:reviews).group(:officer_id).order("count(officer_id) DESC").limit(3)
    end 
end
