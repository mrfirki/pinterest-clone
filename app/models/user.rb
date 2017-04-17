require 'bcrypt'

class User < ApplicationRecord
	has_secure_password

	validates :username, presence: true, length: { maximum: 50 }
	validates :email, presence: true,  uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end


