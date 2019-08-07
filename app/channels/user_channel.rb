class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users_#{user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
