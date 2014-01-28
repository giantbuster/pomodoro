class User < ActiveRecord::Base
	validates :display_name, :email, presence: true
	validates :email, uniqueness: true
	validates :password, length: { minimum: 6 }, :on => :create

	has_secure_password
end