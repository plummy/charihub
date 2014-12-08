class AddPhoneToPost < ActiveRecord::Migration
  def change
    add_column :posts, :phone, :integer
  end
end
