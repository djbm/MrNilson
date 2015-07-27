class SessionsController < ApplicationController

	def new 

	end

	def create

		user = User.authenticate(params[:email], params[:password])

		if user.nil?
			#show message
			#render "new"
		else
			sign_in user
			redirect_to user
		end




	end

	def destroy
		sign_out user
		redirect_to sign_in_path

	end




end