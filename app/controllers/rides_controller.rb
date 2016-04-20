class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(
      :user_id => params[:user_id],
      :attraction_id => params[:attraction_id]
      )

    @message = @ride.take_ride

    flash[:alert] = @message
    redirect_to user_path(@ride.user.id)
  end
end