class RidesController < ApplicationController
    def create
        attraction = Attraction.find(params[:attraction_id])
        ride = Ride.new(user_id: current_user.id, attraction_id: attraction.id)
        flash[:notice] = ride.take_ride
        redirect_to user_path(current_user)
    end
end