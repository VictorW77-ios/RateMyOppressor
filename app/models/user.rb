class User < ApplicationRecord
    has_many :reviews
    has_many :officers, through: :reviews

    has_secure_password
end
