class CommentsController < ApplicationController
	before_action :find_post
	def create
		@comment = @post.comments.create(params[:comment].permit(:ccontent))
		@comment.user_id = session[:user_id]
		@comment.post_id = params[:post_id]
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def find_post
		@post = Post.find(params[:post_id])
	end

end
