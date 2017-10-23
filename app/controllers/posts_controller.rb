class PostsController < ApplicationController
	include UsersHelper

	def show
		@post = Post.find_by(id: params[:id])
		@comment = Comment.new
		@comment.post_id = @post.id

		@comments = Comment.where(post_id: @post.id)
	end

	def index
		@posts = Post.all
	end

	def edit
		current_user

		if @current_user.id
			@post = Post.find_by(id: params[:id])
			if @current_user.id === @post.user_id
				return @post
			end
		end
	end

	def new
		current_user

		if @current_user
			@post = Post.new
		else
			redirect_to '/login'
		end
	end

	def create
		current_user

		if @current_user
			@post = Post.new

			@post.title = params[:post]['title']
			@post.content = params[:post]['content']
			@post.user_id = @current_user['id']

			@post.save

			redirect_to @post
		else
			redirect_to '/login'
		end
	end

	def update
		current_user

		puts params[:post]

		if @current_user && params && params[:id]
			@post = Post.find_by(id: params[:id])

			@post.title = params[:post][:title]
			@post.content = params[:post][:content]

			@post.save

			redirect_to @post
		else
			redirect_to '/login'
		end
	end
end
