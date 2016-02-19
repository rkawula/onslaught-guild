module SessionsHelper

	GUEST_PERMISSION_LEVEL = 5

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

    def permission
    	logged_in? ? current_user.permission_level : GUEST_PERMISSION_LEVEL
    end

    def auth_hash
      request.env["omniauth.auth"]
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
  
end