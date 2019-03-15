class CreateChildminders < ActiveRecord::Migration[5.2]
  def change
    create_table :childminders do |t|
      t.string :name
      t.string :number
      t.string :email
      t.string :address
      t.text :bio
      t.integer :dayrate
      t.string :openingtime
      t.string :closingtime
      t.string :daysopen

      t.timestamps
    end
  end
end
