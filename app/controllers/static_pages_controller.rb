class StaticPagesController < ApplicationController
  def home
    @first_join = current_user.join_rooms.first
    @current_room = @first_join ? @first_join.room : nil
    @invites = current_user.invites
  end
end
