class InvitesController < ApplicationController
  def create
    @invite = Invite.new invite_params
    user = User.find_by id: params[:user_id]
    room = Room.find_by id: params[:room_id]
    if room.users.include? user
      render json: {data: nil}
      return
    end
    if @invite.save
      ActionCable.server.broadcast "users_#{user.id}",
        room: room.name,
        id: @invite.id
      render json: {data: @invite}
    else
      render json: {data: nil}
    end
  end

  private

  def invite_params
    params.permit(:user_id, :room_id)
  end
end
