class ReservationsController < ApplicationController
  def index
  end

  
  
  def confirm
    
    @reservation = Reservation.new(reservation_params)
  
    @room = Room.find(params[:reservation][:room_id])#reservationモデルに関するデータの中の、room_idが予約が行われるroomのidだから、これからひっぱている
  end

  def create
    binding.pry
    @reservation=Reservation.new(params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :user_id, :room_id))
    binding.pry
    if @reservation.save
      redirect_to:reservations_path
    else
      render "confirm"
    end
  end


  

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :room_id, :user_id)
  end
end
