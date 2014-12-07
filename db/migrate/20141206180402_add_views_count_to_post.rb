class AddViewsCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :view_counter, :int
  end
end
