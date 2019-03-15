class UserSerializer < ActiveModel::Serializer
  # class CustomReviewSerializer < ReviewSerializer
  #   attributes :content
  # end
  # has_many :children
  # has_many :reviews, serializer: CustomReviewSerializer
  # attributes :id, :username, :name, :surname, :address

  attributes :data

  def data
    {
      # id: object.id,
      username: object.username,
      name: object.name,
      surname: object.surname,
      address: object.address,
      children: parse_children(object.children),
      reviews: parse_reviews(object.reviews),
    }
  end

  def parse_reviews(reviews)
    parsed = reviews.map do |review|
      {
        childminder_name: review.childminder.name,
        content: review.content
      }
    end

    parsed
  end

  def parse_children(children)
    parsed = children.map do |child|
      {
        name: child.name,
        age: child.age
      }
    end
  end

end
