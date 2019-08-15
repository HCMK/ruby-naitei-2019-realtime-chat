class RoomsController < ApplicationController
  before_action :load_room, only: :destroy
  before_action :current_is_admin, only: :destroy

  def destroy
    if @room.administrators.count > 1
      render json: {data: nil}
      return
    end
    if @room.destroy
      render json: {data: "success"}
      ActionCable.server.broadcast "rooms_#{@room.id}",
          type: "delete_room"
    end
  end

  def create
    @room = Room.new room_params
    if @room.save
      @room.admins.create user_id: current_user.id
      @room.join_rooms.create user_id: current_user.id
      flash[:success] = t(".created")
    else
      flash[:danger] = t(".create_error")
    end
    redirect_to root_path
  end

  def show
    $current_room = Room.find_by id: params[:id]
    if $current_room.nil? || !$current_room.users.include?(current_user)
      redirect_to root_path
      return
    end
    @invites = current_user.invites
    render "static_pages/home"
  end

  private

  def room_params
    params.require(:room).permit(:room_type, :name, :description)
  end
end
