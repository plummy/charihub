class ChangeLongitude < ActiveRecord::Migration
  def change
  	rename_column :posts, :longitute, :longitude
  end
end
