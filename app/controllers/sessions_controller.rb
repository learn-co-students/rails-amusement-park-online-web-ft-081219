class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find (user_params[:name])
        return head(:forbidden) unless @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end