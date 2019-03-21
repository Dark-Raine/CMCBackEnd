class ChildmindersController < ApplicationController
    def index
        @users = Childminder.all
        render json: @users
    end

    def show
        @user = Childminder.find_by(id: params[:id])
        render json: @user
    end

    def register
        @user = Childminder.new(username: params[:username], password: params[:password], name: params[:name])
        @user.save
        if @user.id
            render json: {username: @user, token: issue_token({id: @user.id})}
        else
            render json: {error: 'Failed to register'}, status: 400
        end
    end

    def login
        @user = Childminder.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {user: @user, token: issue_token({id: @user.id})}
        else
            render json: {error: "username/password combination invalid"}, status: 401
        end
    end

    def authenticate
        @user = get_current_minder
        if @user 
            render json: {username: @user.username, token: issue_token({id: @user.id})}
        else
            render json: {error: "username/password combination invalid"}, status: 401
        end
    end

    def mydata
        # byebug
        @user = get_current_minder
        if @user
            render json: @user
        else
            render json: {error: "Unauthorised access"}, status: 401
        end
    end

    def search
        @minders = Childminder.search(params[:search])
        
        if @minders
            render json: @minders
        else
            render json: {error: "Unauthorised access"}, status: 401
        end

    end
end
