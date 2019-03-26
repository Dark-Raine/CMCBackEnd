class LikesController < ApplicationController

    def create
        @user = get_current_user
        @like = Like.new(user_id: @user.id, review_id: params[:review_id])
        if @like
            @like.save
            render json: {message: "created"}, status: 201
        else
            render json: {error: "invalid"}, status: 400
        end
    end
    
    def destroy
        @user = get_current_user
        @like = Like.find_by(id: params[:id])
        if @user === @like.user
            @like.destroy
            render json: {message: "deleted"}, status: 201
        else
            render json: {error: "failed"}, status: 401
        end
    end
end
