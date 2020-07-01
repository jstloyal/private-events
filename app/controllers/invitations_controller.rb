class InvitationsController < ApplicationController
  def create
    event = Event.find(params[:format])
    user = event.creator
    user.invitations.create(attended_event_id: event.id)
    redirect_to events_path
  end

  def destroy
    event = Event.find(params[:id])
    user = event.creator
    invite = user.invitations.find_by(attended_event_id: event.id)
    invite.destroy
    redirect_to events_path
  end
end
