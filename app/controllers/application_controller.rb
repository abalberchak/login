class ApplicationController < ActionController::Base
 

  # before_action :require_login, except: [:create, :new]

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  # def require_login
  # 	unless session[:user_id]
  # 		redirect_to '/users/new'
  # 	end
  # end

  helper_method :current_user
  protect_from_forgery with: :exception
end
