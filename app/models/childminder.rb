class Childminder < ApplicationRecord
    has_secure_password
    has_many :reviews

    def self.search(term)
        # byebug
        all = Childminder.all.select do |minder| 
            
            if minder.address
                minder.address.include?(term)
            else
                false
            end
        end
        # byebug
        all
    end

    def avg_rating
        my_total_rating = 0
        self.reviews.each do |review|
            if review.rating
                my_total_rating+= review.rating
            end
        end
        my_total_rating == 0 ? 0 : (my_total_rating/self.reviews.length).to_f 
    end
end
