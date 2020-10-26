module ReviewsHelper
    def user_reviews
        if @user.reviews.empty?
          tag.h2(link_to('You dont have any reviews yet!', new_review_path))
        # else
        #   user = @user == current_user ? "#{@user.username}'s" content_tag(:h2, "#{user} #{pluralize(@user.reviews.count, 'Review')}:")
        end
    end
end
