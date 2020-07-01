class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def require_login
    if session[:id]
      true
    else
      redirect_to new_session_path
      false
    end
  end
end
