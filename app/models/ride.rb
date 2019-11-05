class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        ticket_b = user.tickets > attraction.tickets
        height_b = user.height > attraction.min_height
        if !ticket_b && !height_b
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !height_b
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif !ticket_b
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
            user.tickets = user.tickets - attraction.tickets
            user.nausea = user.nausea + attraction.nausea_rating
            user.happiness = user.happiness + attraction.happiness_rating
            user.save
        end
    end

end
