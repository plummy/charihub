class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :message
      t.binary :photo
      t.string :full_address
      t.float :longitute
      t.float :latitude

      t.timestamps
    end
  end
end
