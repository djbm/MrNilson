class SessionsController < ApplicationController

	layout "menu" 

	def new 

	end

	def create
		raise 'creando session...'
		if env.present? && env['omniauth.auth'].present?
			user = User.omniauth(env['omniauth.auth'])
		else
			user = User.authenticate(params[:user][:email], params[:user][:password])
		end
		

		if user.nil?
			#render ("users/user_not_exists.html.erb")
			deny_access
		else
			sign_in user
			#raise @current_user.to_yaml
			flash[:success] = "Welcome to the Sample App!"
			redirect_to user
		end

		/#respond_to do |format|
		  format.html { redirect_to home, notice: 'Lesson was successfully created.' }
		  #format.json { render json: @post, status: :created, location: @post }

		end#/
	end

	def destroy

		#user = @current_user
		sign_out
		redirect_to sign_in_path

	end




end


#https://res.cloudinary.com/mrnilsond