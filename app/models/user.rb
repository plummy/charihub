class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	# Validations
	validates :name, presence: true

	geocoded_by :full_address
	after_validation :geocode

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	
end
