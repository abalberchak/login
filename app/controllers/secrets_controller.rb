class SecretsController < ApplicationController

	def index
		@secret = Secret.all
		puts @secret
	end

	def new

	end

	def create
		@secret = Secret.create(content:params['New Secret'], user_id:session[:id])
		redirect_to "/users/#{session[:id]}"
	end

	def destroy
		@secret = Secret.find(params[:id]).destroy
		puts @secret
		redirect_to "/users/#{session[:id]}"
		
	end
end
