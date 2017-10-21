class User < ApplicationRecord
	has_secure_password
	has_many :posts

	validates :name, :email, :password, presence: true
	validates_confirmation_of :password
end
