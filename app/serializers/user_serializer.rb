class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :surname, :address, :password_digest
end
