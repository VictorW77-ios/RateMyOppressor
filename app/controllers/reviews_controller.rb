class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in


    def new 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @review = @user.reviews.build
        else
            @review = Review.new
        end
    end 

    def create 
        @review = current_user.reviews.build(review_params) # associates reviews with user // built off user
        if @review.save
            redirect_to reviews_path   # redirect to officer page with new review
        else 
            render :new
        end 
    end 

    def index 
        @reviews = Review.all 
    end 

    def show 
        @review = Review.find_by_id(params[:id])
        redirect_to reviews_path if !@review
    end 

    def edit
        @review = Review.find(params[:id])
        if !logged_in? 
            flash[:error] = "Login to edit your review"
            redirect_to login_path
        end 
    end 

    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review)
        else 
            render :edit 
        end 
    end 

    def destroy
        @review = Review.find(params[:id])
        @review.delete
        redirect_to user_path(current_user)
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :content)
    end 
end
