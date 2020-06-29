class UsersController < ApplicationController
  def new
    if session[:name].nil?
      @user = User.new
    else
      @user = User.find(session[:id])
      flash[:info] = 'You are already signed in'
      redirect_to @user
    end
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find_by(params[:id])
    @created_events = @user.created_events
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:name] = @user.name
    session[:id] = @user.id
    redirect_to @user
  end

  def destroy
    session.delete(:id)
    @current_user = nil
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
