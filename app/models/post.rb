class Post < ActiveRecord::Base
	validates :post_type, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :category

	enum post_type: { 
	  share_something: 0, 
	  need_help: 1}

	 
end
