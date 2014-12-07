class Post < ActiveRecord::Base
	validates :name, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :category
end
