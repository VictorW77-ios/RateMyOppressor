class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in


    def new 
        @review = Review.new 
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

    private 

    def review_params 
        params.require(:review).permit(:title, :content)
    end 
end
