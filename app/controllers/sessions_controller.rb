class SessionsController < ApplicationController

	def new
		# @user = User.new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			# Check below:
			session[:id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			flash['errors'] = 'Invalid'
			redirect_to "/sessions/new"
			
		end
	end

	def delete
		session.clear
		redirect_to "/sessions/new"
	end
end
