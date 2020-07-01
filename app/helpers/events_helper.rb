module EventsHelper
  def attend_link(event)
    user = User.find(session[:user_id])
    invitations = user.invitations.map(&:attended_event_id)
    if invitations.include?(event.id)
      link_to 'Unattend event', invitation_path(event), method: :delete, class: 'btn btn-xs btn-primary'
    else
      link_to 'Attend event', invitations_path(event), method: :post, class: 'btn btn-xs btn-primary'
    end
  end
end
