require 'bcrypt'

class User < ApplicationRecord
	has_secure_password

  has_many :authentications, :dependent => :destroy
  has_many :pins, :dependent => :destroy

	validates :username, presence: true, length: { maximum: 50 }
	validates :email, presence: true,  uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, presence: true


  	def add_provider(auth_hash)
    	# Check if the provider already exists, so we don't add it twice
    	unless authentications.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authentications.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      end
    end
end


