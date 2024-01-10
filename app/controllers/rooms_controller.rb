class RoomsController < ApplicationController
  def index
  end

  def new
  @user = current_user
  @room=Room.new
  end

  def create #データベースに保存するところ
    @user = current_user.id
    @room = Room.new(params.require(:room).permit(:name, :description, :price, :adress).merge(user_id: current_user.id))
     binding.pry
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
    @rooms=Room.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
