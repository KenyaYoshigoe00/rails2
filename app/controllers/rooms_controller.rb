class RoomsController < ApplicationController
  def  index
    @rooms = current_user.rooms
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :user_id))
    @room.room_icon.attach(params[:room][:room_icon])
    if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to '/rooms'
    else
      render '/rooms/new'
    end
  end
  
  def search
    if params[:keyword].present?
      @rooms = Room.where('name LIKE ? or introduction LIKE ?', "%#{params[:keyword]}%","%#{params[:keyword]}%")
    else
      @rooms = Room.all
    end
  end
  
  def search_address
    if params[:keyword].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:keyword]}%")
    else
      @rooms = Room.all
    end
  end
end
