class OfficersController < ApplicationController
    before_action :set_user
    
    def new 
        @officer = Officer.new
    end 

    # GET /officers
    def index 
        redirect_if_not_logged_in
        @officers = Officer.all 
    end 

    # POST /officers/1 
    def show 
        @officer = Officer.find(params[:id])
    end 

    def most_reviewed
        @officers = Officer.most_reviewed 
    end 

    private 

    def set_user 
        @user = current_user
    end 
end
