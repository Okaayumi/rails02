class ReservationsController < ApplicationController
  def index
  end

  
  
  def confirm
    
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(params[:id])#findにするとエラーになる
  end

  

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :room_id, :user_id)
  end
end
