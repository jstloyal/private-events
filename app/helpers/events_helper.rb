module EventsHelper
  def attend_link(event)
    if session[:user_id]
      user = User.find(session[:user_id])
      invitations = user.invitations.map(&:attended_event_id)
      if invitations.include?(event.id)
        return link_to 'Unattend event', invitation_path(event), method: :delete, class: 'btn btn-xs btn-primary'
      else
        return link_to 'Attend event', invitations_path(event), method: :post, class: 'btn btn-xs btn-primary'
      end
    end
    nil
  end

  def edit_link(event)
    return link_to 'Edit this event', edit_event_path(event), class: "btn btn-xs btn-primary" if session[:user_id]
  end
  
  def delete_link(event)
    c = {confirm: "Are you sure you want to delete the event?"}
    return link_to('Delete this event', event_path(event), method: :delete, data: c, class: "btn btn-xs btn-danger") if session[:user_id]
  end
end
