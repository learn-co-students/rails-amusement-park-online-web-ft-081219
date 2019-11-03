class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update]
    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        @user = current_user
    end

    def new
        if !current_user.admin
            redirect_to attractions_path
        else
            @attraction = Attraction.new
        end
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
        redirect_to attraction_path(@attraction) if !current_user.admin
    end

    def update
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end
end