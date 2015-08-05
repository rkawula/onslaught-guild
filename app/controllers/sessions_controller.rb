class SessionsController < ApplicationController

  def new
  	redirect_to '/auth/bnet'
  end

  def create
    @user = User.find_or_create(auth_hash)
	  reset_session
	  session[:user_id] = @user.id
	  redirect_to root_url
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def failure
  	redirect_to root_url
  end

end