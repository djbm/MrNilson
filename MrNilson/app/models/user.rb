class User < ActiveRecord::Base
	attr_accessor :password 
	serialize :image_info
	serialize :meta
	#attr_accessible :name, :email, :encrypted_password, :salt

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i



	validates :email, presence: true, format: {with: email_regex}, uniqueness: {case_sensitive: false}

	validates :firstname, presence: true, length: {maximum: 50}
	
	validates :lastname, presence: true, length: {maximum: 50}

	validates :password, presence: true, confirmation: true, length: {within: 1..40}, :if => :do_validate?	

	validates :username, length: {maximum: 50}

	before_save :encrypt_password	  	
	before_save { self.email = email.downcase }		


	def do_validate?
		return self.new_record?
	end

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password) 
	end		

	def self.create(email, password, firstname, lastname, username = "")

		user = User.new()
		user.username = username unless (username.nil? || username == "")
		user.email = email.to_s
		user.firstname = firstname.to_s
		user.lastname = lastname
		user.password = password.to_s
		user.image_info = {"hola" => "goo"}
		user.save

		return user

	end


	#class method to check if user's email and submitted_password are valid
	def self.authenticate(email, submitted_password)
		user = User.find_by_email(email)
		
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
		return nil

	end

	def self.get_user_image

		return self

	end


	private

		def encrypt_password
			#generate a new salt if it's a new user
			if self.new_record?
				self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{password}") 

				#encrypt the password and store that in the encrypted_password field
				self.encrypted_password = encrypt(password)
			end
		end

		def encrypt(pass)
			Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
		end




end
