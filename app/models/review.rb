class Review < ApplicationRecord
    belongs_to :childminder
    belongs_to :user
end
