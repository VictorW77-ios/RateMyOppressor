class SessionsController < ApplicationController 


    def home 
    end 

    def create 
        user = User.find_by(username: params[:user][:username])
        
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else 
            flash[:message] = "Incorrect username/password"
            redirect_to '/login'
        end 
    end 


    def destroy 
        # binding.pry
        session.clear 
        redirect_to root_path
    end 


end 