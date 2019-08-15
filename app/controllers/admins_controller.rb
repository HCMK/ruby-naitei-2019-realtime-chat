class AdminsController < ApplicationController
  before_action :load_room
  before_action :current_is_admin

  def create
    user = User.find_by id: params[:user_id]
    if user.nil? || is_admin?(user) || !in_room?(user)
      render json: {data: nil}
      return
    end
    @room.administrators << user
    ActionCable.server.broadcast "rooms_#{@room.id}",
          user: user,
          type: "add_admin"
    render json: {data: 200}  
  end

  def destroy
    if @room.administrators.count > 1 
      @room.administrators.delete(current_user)
      ActionCable.server.broadcast "rooms_#{@room.id}",
          user: current_user,
          type: "delete_admin"
      render json: {data: "success"}
      return
    end
    render json: {data: nil, reason: "You R only admin"}    
  end
end
