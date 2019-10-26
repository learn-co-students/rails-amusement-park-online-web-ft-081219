class UsersController < ApplicationController 

    before_action :logged_in?

    skip_before_action :logged_in?, only: [:login,:new,:create,:signin]

    def signin 
    end

    def login 
        p params
        @user = User.find_by(id: params[:user_name])
        if @user 
            @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            
           redirect_to user_path(@user)
        end
    end
    
    def new 
        @user = User.new
    
    end

    def show 
        @user = User.find(params[:id])
    end

    def create 
        p params
        @user = User.create(user_params ) 
   
    
       if @user
        is_admin?(@user)
        session[:user_id] = @user.id
        redirect_to user_path(@user) 
       else 
        render "users/new"
       end
    end
    private
    def user_params 
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
    end

    def is_admin?(user) 
        user.update(admin: true) if params.require(:user).permit(:admin)[:admin] == "1"
    end

    def singin_params 
        params.permit(:user_name, :password)
    end

    def logged_in? 
        redirect_to "/" unless  session[:user_id]
    end
end