class SessionsController < ApplicationController

  def new
  	redirect_to '/auth/bnet'
  end

  def create
    @user = User.find_or_create(auth_hash)
	  reset_session
	  session[:user_id] = @user.id
	  redirect_to root_path
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def failure
  	redirect_to root_path
  end

end