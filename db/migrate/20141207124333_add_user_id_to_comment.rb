class AddUserIdToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :int, limit: 1
  end
end
