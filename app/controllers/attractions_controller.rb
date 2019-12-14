class AttractionsController < ApplicationController

    before_action :find_user, only: [:index, :show, :update]

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def index
        # @user = User.find_by(id: current_user.id)
        @attractions = Attraction.all
    end

    def show
        # @user = User.find_by(id: current_user.id)
        @attraction = Attraction.find_by(id: params[:id])
        @new_ride = Ride.new
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])   
    end

    def update
        # @user = User.find_by(id: current_user.id)
        if @user.admin
            @attraction = Attraction.find_by(id: params[:id])
            @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            flash[:notice] = "Sorry! Only an admin can edit an attraction."
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def find_user
        @user = User.find(current_user.id)
    end
end
