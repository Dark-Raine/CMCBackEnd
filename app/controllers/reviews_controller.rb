class ReviewsController < ApplicationController
    def create
        @user = get_current_user
        @review = Review.new(content: params[:content], childminder_id: params[:id], user_id: @user.id, rating: params[:rating])
        if @user && @review
            @review.save
            render json: {message: "created"}, status: 201
        else
            render json: {error: "failed"}, status: 401
            
        end
    end
    
    def update
        @user = get_current_user
        @review = Review.find_by(id: params[:id])
        
        if @user === @review.user
            @review.content = params[:content]
            @review.save
            render json: {message: "updated"}, status: 201
        else
            render json: {error: "failed"}, status: 401
        end
    end

    def destroy
        @user = get_current_user
        @review = Review.find_by(id: params[:id])
        
        if @user === @review.user
            @review.destroy
            render json: {message: "deleted"}, status: 201
        else
            render json: {error: "failed"}, status: 401
        end
    end
end
