class InvitesController < ApplicationController
  def create
    @invite = Invite.new invite_params
    render json: {data: @invite} if @invite.save
  end

  private

  def invite_params
    params.permit(:user_id, :room_id)
  end
end
