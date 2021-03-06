class ApplicationController < ActionController::Base
	include Pundit
	
  protect_from_forgery with: :exception
  

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def admin_types
    ['AdminUser']
  end

  def after_sign_in_path_for(resource)
  	posts_path
	end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(posts_path)
  end

end
