class RidesController < ApplicationController

    def create
        @user = User.find(current_user.id)
        @ride = Ride.new(user_id: current_user, attraction_id: params[:ride][:attraction])
        # @ride = Ride.create(user_id: current_user, attraction_id: params[:ride][:attraction])
        @ride.user_id = current_user.id
        @ride.save
        flash[:message] = @ride.take_ride 
        redirect_to user_path(@user)
    end

end
