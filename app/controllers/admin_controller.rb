class AdminController < ApplicationController
  before_action :load_room
  before_action :current_is_admin

  def create
    user = User.find_by params[:room]
    if user.nil? || !is_admin?(user) || !in_room?(user)
      render json: {status: "fails"}
      return
    end
    if @room.admins.create(user)
      render json: {status: "success"}
      return
    end
    render json: {status: "fails"}
  end

  def destroy
    if @room.administrators.count > 1
      @room.administrators.delete(current_user)
      render json: {status: "success"}
      return
    end
    render json: {status: "fails", reason: "You R only admin"}
  end
end
