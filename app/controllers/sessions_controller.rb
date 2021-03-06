class SessionsController < ApplicationController
	def create
  	auth = request.env["omniauth.auth"]
		user = User.find_by_uid(auth[:uid]) || User.create_user(auth)
		session[:user_id] = user.id
		next_url = request.env["omniauth.params"]['next']
	  (next_url)? (redirect_to next_url) : (redirect_to spotfixes_path)
	end

	def auth_fail
		redirect_to root_path, :notice => "Failed"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, :notice => "Logged out!"
	end
end
