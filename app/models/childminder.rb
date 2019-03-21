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
end
