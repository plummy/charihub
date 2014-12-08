class AddTypeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :type, :int, :limit => 1
  end
end
