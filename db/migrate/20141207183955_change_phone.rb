class ChangePhone < ActiveRecord::Migration
  def change
  	change_column :posts, :phone,  :string
  end
end
