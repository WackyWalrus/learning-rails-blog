module UsersHelper
	def current_user
	  	if session && session[:current_user] && session[:current_user]['id']
	  		@current_user = User.find_by(id: session[:current_user]['id'])
	  	else
	  		@current_user = false
	  	end
	end
end
