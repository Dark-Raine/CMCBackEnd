class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :childminder_id, :content
end
