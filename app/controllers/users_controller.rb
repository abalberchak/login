class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		# @secret = Secret.select(:content).where(user_id:'2')
		@secret = Secret.where(user_id:params[:id]).all.pluck(:content)
		puts @secret
	end

	def new

	end

	def create
		@user = User.create(email:params['email'], name:params['name'], password:params['password'])
		if @user.valid?
			session[:id] = @user.id
			redirect_to "/users/#{@user.id}"
		else 
			flash['errors'] = @user.errors.full_messages
			redirect_to "/users/new"
		end

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		User.find(params[:id]).update(email:params['email'], name:params['name'])
		redirect_to "/users/#{@user.id}"
	end

	def delete
		session.clear
		@user = User.find(params[:id]).destroy
		redirect_to "/sessions/new"
	end

	
end
