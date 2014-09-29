class SessionsController < ApplicationController
	def create
  	auth = request.env["omniauth.auth"]
		user = User.find_by_uid(auth[:uid]) || User.create_user(auth)
		session[:user_id] = user.id
		redirect_to users_path
	end

	def auth_fail
		redirect_to users_path, :notice => "Failed"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end
