class UsersController < ApplicationController
  def search
    @users = shift_me User.search_name params[:name]
    respond_to do |format|
      format.json{render json: {data: @users}}
    end
  end

  private

  def shift_me users
    users = (users.to_a - [current_user]) if users.include?(current_user)
    users
  end
end
