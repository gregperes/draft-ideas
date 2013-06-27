class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?, :current_user

  def store_signed_in_user(user)
  	session[:user_id] = user.id
  end

  def current_user
  	if user_signed_in?
  		User.find(session[:user_id])
  	end
  end

  def user_signed_in?
		session[:user_id].present?
	end
end