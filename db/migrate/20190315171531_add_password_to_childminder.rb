class AddPasswordToChildminder < ActiveRecord::Migration[5.2]
  def change
    add_column :childminders, :password_digest, :string
  end
end
