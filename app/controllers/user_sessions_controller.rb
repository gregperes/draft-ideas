class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
  	user = User.authenticate(params[:login], params[:password])
  	if user.present?
  		store_signed_in_user(user)
  		redirect_to root_path
  	else
  		redirect_to signin_path, :alert => "Login ou senha invalidos."
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
