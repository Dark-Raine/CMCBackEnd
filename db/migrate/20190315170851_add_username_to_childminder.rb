class AddUsernameToChildminder < ActiveRecord::Migration[5.2]
  def change
    add_column :childminders, :username, :string
  end
end
