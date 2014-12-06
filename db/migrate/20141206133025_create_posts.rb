class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :message
      t.binary :photo
      t.string :full_address
      t.float :longitute
      t.float :latitude
      t.belongs_to :user
      t.belongs_to :category
      t.timestamps
    end
  end
end
