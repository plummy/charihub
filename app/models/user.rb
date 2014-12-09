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

	# Paperclip
	has_attached_file :avatar, :styles => { :thumb => "100x100>" },
		:default_url => "users/avatars/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage/
	validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

end
