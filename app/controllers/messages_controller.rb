class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build message_params
    if @message.save
      render json: {data: @message} 
      ActionCable.server.broadcast "rooms_#{@message.room_id}",
          data: @message,
          user: @message.user.name
    end
  end

  private

  def message_params
    params.permit(:content, :room_id)
  end
end
