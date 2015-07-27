module SessionsHelper

	def sign_in user
		session[:user_id] = user.id
		self.current_user = user
	end 

	#setter current_user
	def current_user=(user)
		@current_user = user
	end

	#getter current_user

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in?
		!self.current_user.nil?
	end

	def sign_out
		session[:user_id] = nil
		self.current_user = nil
	end

	def current_user?(user)
		user == self.current_user
	end

	def deny_access
		redirect_o sign_in_path, notice => "Please sign in to access this page"
	end


end
