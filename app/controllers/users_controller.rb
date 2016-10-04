class UsersController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end
	def show 
		@user = User.find(params[:id])
	end
	def user_params
		allow = [:username, :password, :email]
		params.require(:user).permit(allow)
	end
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			@current_user = @user
			redirect_to posts_path, :notice => "Your account was saved"
		else
			render "new"
		end
	end
end
