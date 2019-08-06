class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password)
    end
  end

  private

  def load_room
    @room = Room.find_by id: params[:id]
    return if room
    render json: {status: "fail"}
  end

  def is_admin? user
    @room.administrators.include? user
  end

  def current_is_admin
    return if is_admin? current_user
    render json: {status: "fails"}
  end

  def in_room? user
    @room.users.include? user
  end
end
