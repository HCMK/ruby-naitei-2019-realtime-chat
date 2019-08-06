class JoinRoomsController < ApplicationController
  def create
    @invite = Invite.find_by id: params[:invite_id]
    @join = JoinRoom.new user_id: @invite.user_id, room_id: @invite.room_id
    return unless @join.save
    @invite.destroy
    render json: {room_name: @join.room.name, count: Invite.count}
  end
end
