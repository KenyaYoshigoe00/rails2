class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end
  
  def show
      redirect_back(fallback_location: root_path)
  end
  
  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id))
    if @reservation.invalid?
      @room = Room.find(params[:reservation][:room_id])
      render '/rooms/show'
    end
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :people, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to '/reservations'
    else
      redirect_to '/rooms'
    
    end
  end
end
