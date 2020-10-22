class ApplicationController < ActionController::Base

    # allows me to access these methods in views
    helper_method :current_user, :logged_in?

    private 
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
            # prevents it from making a call to the db if there isn't a user
            # finds by id in user table
            # memoization 
    end 

    def logged_in? 
        !!session[:user_id]
    end 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end 
end
