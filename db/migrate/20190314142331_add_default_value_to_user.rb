class AddDefaultValueToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :address, :string, default: "100 Garratt Ln London SW18 4DJ"
  end
end
