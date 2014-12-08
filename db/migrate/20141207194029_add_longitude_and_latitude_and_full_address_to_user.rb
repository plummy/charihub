class AddLongitudeAndLatitudeAndFullAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
    add_column :users, :full_address, :string
  end
end
