class ChildminderSerializer < ActiveModel::Serializer
  # attributes :id, :name, :number, :email, :address, :bio, :dayrate, :openingtime, :closingtime, :daysopen
  # attributes(*Childminder.attribute_names.map(&:to_sym))
  attributes :data
  def data
    {
      id: object.id,
      name: object.name,
      number: object.number,
      email: object.email,
      address: object.address,
      bio: object.bio,
      dayrate: object.dayrate,
      openingtime: object.openingtime,
      closingtime: object.closingtime,
      daysopen: object.daysopen,
      averagerating: object.avg_rating,
      reviews: parse_reviews(object.reviews)
    }
  end

  def parse_reviews(reviews)
    parsed = reviews.map do |review|
      {
        content: review.content,
        reviewer: review.user.name,
        username: review.user.username,
        rating: review.rating.to_f,
        id: review.id,
        likedby: liked_list(review.likes)
      }
    end
  end

  def liked_list(liked_by)
    parsed = liked_by.map do |liker|
      {
        username: liker.user.username,
        id: liker.id.to_i
      }
    end
  end
  
end
