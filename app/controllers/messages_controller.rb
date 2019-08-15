class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build message_params
    room = Room.find_by id: params[:room_id]
    return unless room.users.includes(current_user) && params[:content] != ""
    if @message.save
      render json: {data: @message}
      ActionCable.server.broadcast "rooms_#{@message.room_id}",
          data: @message,
          user: @message.user,
          type: "new_message"
    end
  end

  private

  def message_params
    params.permit(:content, :room_id)
  end
end
