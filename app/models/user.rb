class User < ApplicationRecord
    has_many :reviews
    has_many :officers, through: :reviews
    has_many :posted_reviews, through: :reviews, source: :officer

    has_secure_password
end


# --- INSERT NESTED ROUTES --- 
'/users'
'/officers'
'/reviews'