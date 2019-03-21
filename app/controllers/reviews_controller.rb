class ReviewsController < ApplicationController
    def create
        @user = get_current_user
        @review = Review.new(content: params[:content], childminder_id: params[:id], user_id: @user.id)
        if @user && @review
            @review.save
            render json: {message: "created"}, status: 201
        else
            render json: {error: "failed"}, status: 401
            
        end
    end

    def update

    end

    def destroy

    end
end
