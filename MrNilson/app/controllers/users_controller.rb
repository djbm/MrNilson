class UsersController < ApplicationController


layout "menu" 

def new
	@user = User.new()

end

def create
	@user = User.create(params[:user]["email"], params[:user]["password"], params[:user]["firstname"], params[:user]["lastname"])

	

	if !@user.nil?
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #redirect_to(action: "home", controller: "application")
    else
      render "new"

  	end
end

def edit

end

def update
	
end

def destroy

end

def tests

	respond_to do |format|
        format.html
        format.json	      
  	end

end

def set_user_image

	options = Hash.new{}
	errors = true
	@user = nil

	if params[:picture].present?
		options = Cloudinary::Uploader.upload(params[:picture], :invalidate => true)
	end

	if params[:user_id].present? && options.present?
		@user = User.find(params[:user_id])
		if(@user.image_info.present? && @user.image_info["public_id"].present?)
			Cloudinary::Uploader.destroy(@user.image_info["public_id"], :invalidate => true)			
		end
		@user.image_info = Hash.new
		@user.image_info = options
		@user.save!(validate: false)
		errors = false
	end

	 respond_to do |format|
	      if @user.present? && @user.save && !errors
	        format.json {render :json => {"reponse_errors" => errors, "secure_url" => options["secure_url"]}}
	      else
	        format.json {render :json => {"reponse_errors" => true}}
	      end
      end

end

def show
  @user = User.find(params[:id])
end

/#def register

	user = User.create(params[:user]["email"], params[:user]["password"], params[:user]["firstname"], params[:user]["lastname"])

	redirect_to(action: "home", controller: "application")
end#/




private
  ## Strong Parameters 
  def user_params
    params.require(:user).permit(:name, :password_digest, :password, :password_confirmation)
  end

end
