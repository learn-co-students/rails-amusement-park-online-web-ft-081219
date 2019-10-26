module UsersHelper
    def display_admin(user) 
        user.admin ? "ADMIN" : nil
    end

    def diplay_link_for_admin(user)
        p user
        user.admin ? link_to("New Attraction", new_attraction_path) : nil
    end

   
end
