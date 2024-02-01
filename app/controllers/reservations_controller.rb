class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all

  end

  
  
  def confirm
    @reservation = Reservation.new(reservation_params)
  
    
   @room = Room.find(params[:reservation][:room_id])#reservationモデルに関するデータの中の、room_idが予約が行われるroomのidだから、これからひっぱている

   @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :room_id, :user_id))

   if @reservation.valid?
     # バリデーションが成功した場合の処理
     # 例: 予約が成功した旨のメッセージを表示し、予約完了画面にリダイレクトするなど
     redirect_to reservations_path
   else
     # バリデーションが失敗した場合の処理
     # 例: エラーメッセージを表示し、元の画面に戻るなど
     flash.now[:alert] = "予約に失敗しました"
     render "rooms/show"
   end
  
   

  end

  def create
  
    @room = Room.find(params[:reservation][:room_id])
   
    @reservation=Reservation.new(params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約成功"
      redirect_to reservations_path
    else
      flash[:notice] = "予約失敗"
      render "confirm"
    end
  end


  

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :room_id, :user_id)
  end
end
