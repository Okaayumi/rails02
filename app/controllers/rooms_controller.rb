class RoomsController < ApplicationController
  
  def index
    @rooms=Room.all
  end

  def new
  @user = current_user
  @room=Room.new
  end

  def create #データベースに保存するところ
    @user = current_user
    @room = Room.new(params.require(:room).permit(:name, :description, :price, :adress,:image_room).merge(user_id: current_user.id))
    #@room.image_room = "defolt_room_image.png"
   
    
    #@reservation = Reservation.new(params[:room].slice(:start_date, :finish_date, :number_of_people))
   
    if @room.save
     
      flash[:notice] = "お部屋を新規登録しました"
      redirect_to:rooms
    else
      flash[:notice] = "お部屋の登録に失敗しました"
      render "new"
    end
  end

  

  def show
    
    @user = current_user
    @room=Room.find(params[:id])
    @reservation = Reservation.new
    @back_link = request.referer if request.referer.present?

    

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
