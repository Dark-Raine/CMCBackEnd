class User < ApplicationRecord
    has_secure_password
    has_many :children, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :likes
    
end
