class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	# Validations
	validates :name, presence: true
	
	has_many :posts, dependent: :destroy

	#after_create :skip_conf!

	def skip_conf!
		self.confirm! if Rails.env.development?
	end
end
