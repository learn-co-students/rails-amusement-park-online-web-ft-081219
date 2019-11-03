class UsersController < ApplicationController
    def show
        if logged_in?
            @user = User.find(params[:id])
        else
            redirect_to '/'
        end
    end
        
    def new
        @user = User.new
    end

    def create
        if @user = User.find_by(name: params[:user][:name])
            redirect_to '/users/new' if !@user.authenticate(params[:user][:password])
        else
            @user = User.create(user_params)
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :height, :nausea, :tickets, :admin)
    end
end
