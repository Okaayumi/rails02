class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all

  end

  
  
  def confirm
    #@reservation = Reservation.new(reservation_params)
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :room_id, :user_id))
    
   @room = Room.find(params[:reservation][:room_id])#reservationモデルに関するデータの中の、room_idが予約が行われるroomのidだから、これからひっぱている
   @user=User.find(params[:reservation][:user_id])
   

   unless @reservation.valid? 
    # バリデーションが失敗した場合の処理
    # 例: エラーメッセージを表示し、元の画面に戻るなど
    puts @reservation.errors.full_messages
    flash.now[:alert] = "予約に失敗しました"
    render "rooms/show"
  end



  end

  def show
    head :not_found
  end 
  def create
  
    @room = Room.find(params[:reservation][:room_id])
   
    @reservation=Reservation.new(params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約成功"
      redirect_to reservations_path
    else
      flash[:notice] = "予約失敗"
      render "rooms/show"
    end
  end





  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :number_of_people, :room_id, :user_id)
  end
end
