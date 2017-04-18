class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
		    session[:user_id] = user.id
		    redirect_to users_path, notice: 'Logged in!'
		else
		    flash.now.alert = 'Email or password is invalid'
		    render :new
		end
	end


	def destroy
  		session[:user_id] = nil
  		redirect_to root_path, notice: 'Logged out!'
	end


	def create_from_omniauth
	    auth_hash = request.env['omniauth.auth']
		 
		if session[:user_id]
		    # Means our user is signed in. Add the authorization to the user
		    User.find(session[:user_id]).add_provider(auth_hash)
		 
		    redirect_to users_path
		else
		    # Log him in or sign him up
		    auth = Authentication.find_or_create(auth_hash)
		 
		    # Create the session
		    session[:user_id] = auth.user.id
		    redirect_to users_path
		end
  	end
end




