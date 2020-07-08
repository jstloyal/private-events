class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @upcoming_events = @user.attended_events.all_upcoming_events
    @past_events = @user.attended_events.all_past_events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def require_same_user
    return unless current_user == @user

    flash[:danger] = 'You can only edit your own account'
    redirect_to root_path
  end
end
