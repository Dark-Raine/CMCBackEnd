class AddRatingToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rating, :decimal, precision: 5, scale: 2
  end
end
