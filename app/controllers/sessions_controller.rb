class SessionsController < ApplicationController
  def new
    # new
  end

  def create
    @user = User.find_by_name(params[:session][:name])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "You have been succesfully signed in as #{@user.name}"
      redirect_to events_path
    else
      flash[:warning] = 'There is no such user'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been signed out succesfully'
    redirect_to new_session_path
  end
end
