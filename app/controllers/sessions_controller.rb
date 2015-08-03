class SessionsController < ApplicationController

  def new
  	redirect_to '/auth/bnet'
  end

  def create
  auth = request.env["omniauth.auth"]
  @user = User.find_or_create(auth)
	reset_session
	session[:user_id] = @user.id
	redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Signed out!"
  end

  def failure
  	redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end