class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def register
        @user = User.new(username: params[:username], password: params[:password], name: params[:name], surname: params[:surname])
        @user.save
        if @user.id
            render json: {username: @user, token: issue_token({id: @user.id})}
        else
            render json: {error: 'Failed to register'}, status: 400
        end
    end

    def login
        # byebug
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {user: @user, token: issue_token({id: @user.id})}
        else
            render json: {error: "username/password combination invalid"}, status: 401
        end
    end

    def authenticate
        @user = get_current_user
        if @user 
            render json: {username: @user.username, token: issue_token({id: @user.id})}
        else
            render json: {error: "username/password combination invalid"}, status: 401
        end
    end

    def mydata
        # byebug
        @user = get_current_user
        if @user
            render json: @user
        else
            render json: {error: "Unauthorised access"}, status: 401
        end
    end
end
