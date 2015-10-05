class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  layout "application" 

  before_action :current_user
  before_action :require_login
  protect_from_forgery with: :null_session
  skip_before_action :require_login, only: [:new, :create]

  def home
  	@new_user = User.new
  	@existent_user = User.new
  	
  	render "sessions/index.html.erb"
  end


 
  private
 
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to sign_in_path # halts request cycle
    end
  end

end
