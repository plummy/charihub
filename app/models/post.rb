class Post < ActiveRecord::Base
	validates :name, presence: true
	validates :type, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :category

	enum type: { 
	  share: 0, 
	  ask: 1}
end
