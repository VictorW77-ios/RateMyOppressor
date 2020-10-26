class OfficersController < ApplicationController
  before_action :set_user


  def new 
    @officer = Officer.new
  end 

    # GET /officers 
  def index 
    @officers = Officer.all
  end 
    
    # GET /officers/1
  def show 
    @officer = Officer.find(params[:id])
  end 

  private 

  def set_user
    @user = current_user 
  end 

end
