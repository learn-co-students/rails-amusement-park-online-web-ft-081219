class RidesController < ApplicationController 
    def create
        @user = User.find(ride_params[:user_id])
        @attraction = Attraction.find(ride_params[:attraction_id])
        if check_before_create(user: @user, attraction: @attraction) 
            new_ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
            new_user_tickets =  @user.tickets - @attraction.tickets
            p @user.happiness 
            p @user.nausea 
            p @attraction.happiness_rating 
            p @attraction.nausea_rating
            @user.rides << new_ride 
            @user.update(tickets: new_user_tickets, happiness: @attraction.happiness_rating, nausea:  @attraction.nausea_rating)
            @attraction.rides << new_ride
            flash[:notice] = "Thanks for riding the #{@attraction.name}!"
            redirect_to @user
        else 
            redirect_to @user
        end
        
    end

    private 
    def ride_params 
        params.require(:ride).permit(:attraction_id,:user_id)
    end

    def check_before_create(user:, attraction:)

        if user.height < attraction.min_height && user.tickets < attraction.tickets
            flash[:notice] = "You are not tall enough to ride the #{attraction.name} <br> You do not have enough tickets to ride the #{attraction.name}"
            return false
        elsif user.height < attraction.min_height
            flash[:notice] = "You are not tall enough to ride the #{attraction.name}"
            return false
        
        elsif user.tickets < attraction.tickets 
            flash[:notice] = "You do not have enough tickets to ride the #{attraction.name}"
            return false
        else
            return true
        end
    end


end