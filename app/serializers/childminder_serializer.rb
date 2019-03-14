class ChildminderSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :email, :address, :bio, :dayrate, :openingtime, :closingtime, :daysopen
end
