class AddTypeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :user, :belongs_to
  end
end
