class JoinRoomsController < ApplicationController
  before_action :load_room, only: :destroy
  def create
    @invite = Invite.find_by id: params[:invite_id]
    @join = JoinRoom.new user_id: @invite.user_id, room_id: @invite.room_id
    return unless @join.save
    @invite.destroy
    ActionCable.server.broadcast "rooms_#{@join.room_id}",
          user: @join.user,
          type: "new_member"
    render json: {room_name: @join.room.name, count: Invite.count, id:@join.room.id}
  end

  def destroy
    user = User.find_by id: params[:user_id]
    if user && in_room?(user) && !is_admin?(user) && ( is_admin?(current_user) || user == current_user) && @room.users.delete(user) 
      render json: {data: 200}
      ActionCable.server.broadcast "rooms_#{@room.id}",
          user: user,
          type: "delete_member"
    else
      render json: {data: nil}
    end      
  end
end
