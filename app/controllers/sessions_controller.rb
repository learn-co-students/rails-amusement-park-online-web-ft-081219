class SessionsController < ApplicationController 
  

    def logout 
        session[:user_id] ? session.clear : nil 
        redirect_to "/"
    end
end