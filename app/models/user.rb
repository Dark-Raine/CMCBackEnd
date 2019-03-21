class User < ApplicationRecord
    has_secure_password
    has_many :children
    has_many :reviews
end
