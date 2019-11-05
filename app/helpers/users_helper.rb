module UsersHelper
    def admin_user?
        User.find(session[:user_id]).admin
    end

end
