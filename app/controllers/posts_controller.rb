class PostsController < ApplicationController
	def index
		@posts = Post.where(userid: session[:user_id])	
	end 
	
	def show
		@post = Post.find(params[:id])
		@comments = Comment.where(post_id: @post)
	end

	def new 
		@post = Post.new
	end

	def post_params
		  allow = [:title,:content, :userid]
		  params.require(:post).permit(allow)
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path, :notice => "Your post was saved"
		else
			render "new"
		end
	end
	
	def edit 
		@post = Post.find(params[:id])
	end

	def update 
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to posts_path, :notice => "Your post was updated"
		else 
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post was deleted"
	end
end

