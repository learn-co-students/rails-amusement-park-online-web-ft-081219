class AttractionsController < ApplicationController
    before_action :set_attraction, only:[:show,:edit,:update]
    include UsersHelper
    ###   GENERAL PUBLIC

    def index
        @attractions = Attraction.all
        if admin_user?
            render :index_admin
        else
            render :index
        end
    end

    def show
        # @attraction = Attraction.find(params[:id])
    end

    def ride
        @user = User.find(session[:user_id])
        ride = @user.rides.build(attraction_id:params[:id])
        if ride.take_ride == true
            session[:message] = "Thanks for riding the #{Attraction.find(params[:id]).name}!"
        else
            session[:message] = ride.take_ride
        end
        redirect_to user_path(@user)
    end

    #admin only

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.new(attraction_params)
        attraction.save
        redirect_to attraction_path(attraction)
    end

    def edit
        # @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction.assign_attributes(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            redirect_to edit_attraction_path(@attraction)
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name,:min_height,:happiness_rating,:nausea_rating,:tickets)
    end

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end
end