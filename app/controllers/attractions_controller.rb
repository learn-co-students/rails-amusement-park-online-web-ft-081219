class AttractionsController < ApplicationController
   def new 
    @attraction = Attraction.new
   end

   def index 
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
   end

   def edit 
    @attraction = Attraction.find(params[:id])
   end 

   def update 
    @attraction = Attraction.find(params[:id]) 
    @attraction.update(attraction_params)
    redirect_to @attraction
   end

   def show 
     @user = User.find(session[:user_id])
     
    @attraction = Attraction.find(params[:id])

    @ride = Ride.new
   end

   def create 
        attraction = Attraction.create(attraction_params)
        redirect_to attraction
   end



   private 
   def attraction_params 
    params.require(:attraction).permit(:name,:min_height, :happiness_rating,:nausea_rating,:tickets)
   end
end