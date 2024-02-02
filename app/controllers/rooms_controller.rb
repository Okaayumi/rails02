class RoomsController < ApplicationController
  
  def index
    @rooms=Room.all
  end

  def new
  @user = current_user
  @room=Room.new
  end

  def create #データベースに保存するところ
    @user = current_user.id
    @room = Room.new(params.require(:room).permit(:name, :description, :price, :adress,:image_room).merge(user_id: current_user.id))
    #@room.image_room = "defolt_room_image.png"

    @reservation = Reservation.new(start_date: params[:room][:start_date])
   
    if @reservation.valid?
      # バリデーションが成功した場合の処理
      # 例: 予約が成功した旨のメッセージを表示し、予約完了画面にリダイレクトするなど
      redirect_to "reservations/confirm"
    else
      # バリデーションが失敗した場合の処理
      # 例: エラーメッセージを表示し、元の画面に戻るなど
      puts @reservation.errors.full_messages
      flash.now[:alert] = "予約に失敗しました"
      render "rooms/show"
    end
  end

  def show

    @user = current_user
    @room=Room.find(params[:id])
    @reservation = Reservation.new

    
    
  end

  def own
    
    @user = current_user
    
    @rooms=@user.rooms
  end

  def edit
  end

  def update
  end

  def destroy
  end

  
  
end
