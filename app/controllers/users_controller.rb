class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        # binding.pry
        required_login
        @user = User.find(params[:id])
        if @user.admin
            render :show_admin
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def required_login
        if session[:user_id].nil?
            redirect_to '/'
        end
    end
end