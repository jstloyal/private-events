class EventsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @upcoming_events = Event.all_upcoming_events
    @past_events = Event.all_past_events
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @user = User.find(session[:user_id])
    @event = @user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event has been succesfully saved'
      redirect_to events_path
    else
      flash[:alert] = @event.errors.full_messages
      render 'new'
    end
  end

  def edit
    # edit
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :location)
  end

  def require_login
    if session[:user_id]
      true
    else
      redirect_to new_session_path
      false
    end
  end
end
