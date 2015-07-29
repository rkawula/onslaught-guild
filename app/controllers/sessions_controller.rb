class SessionsController < ApplicationController

  def new
  	redirect_to '/auth/bnet'
  end

  def create
  	# render text: request.env['omniauth.auth'].to_yaml
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
    				  :uid => auth['uid'].to_s || User.create_with_omniauth(auth))
	reset_session
	session[:user_id] = user.uid
	redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    #reset_session
    #redirect_to root_url, :notice => "Signed out!"
  end

  def failure
  	#redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end