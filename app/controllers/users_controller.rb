class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
	end

	def new
		@user = User.new
	end

	def login
		login_get if request.get?
		login_post if request.post?
	end

	def logout
		reset_session
		redirect_to '/'
	end

	def create
		@user = User.new

		@user.name = params[:user][:name]
		@user.email = params[:user][:email]
		@user.password = params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]

		@user.save

		if @user.authenticate(params[:user][:password])
			session[:current_user] = {
				id: @user.id,
				name: @user.name,
				email: @user.email
			}
		end

		redirect_to @user
	end

	private
		def login_get
			@user = User.new
		end

		def login_post
			@user = User.find_by(email: params[:user][:email])

			if @user
				if @user.try(:authenticate, params[:user][:password])
					session[:current_user] = {
						id: @user.id,
						name: @user.name,
						email: @user.email
					}
				end
			end

			redirect_to '/'
		end
end
