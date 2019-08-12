class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
