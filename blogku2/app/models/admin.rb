class Admin < ActiveRecord::Base
	before_save { self.email = email.downcase }
<<<<<<< HEAD

	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, length: { minimum: 6 }
=======
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, length: { minimum: 6 }

	def Admin.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Admin.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private 
		def create_remember_token
			self.remember_token = Admin.encrypt(Admin.new_remember_token)
		end
>>>>>>> 38396a90dc3d58d5a9776e8678d948406393b43a
end
