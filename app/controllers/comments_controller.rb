class CommentsController < ApplicationController
	include UsersHelper

	def create
		current_user
		if @current_user
			@comment = Comment.new
			@comment.content = params[:comment][:content]
			@comment.post_id = params[:post_id]
			@comment.user_id = @current_user.id
			@comment.save

			@post = Post.find_by(id: params[:post_id])
			redirect_to @post
		end
	end
end
