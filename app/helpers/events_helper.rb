module EventsHelper
  def attend_link(event)
    a = invitation_path(event)
    b = 'btn btn-xs btn-primary'
    c = invitations_path(event)
    if session[:user_id]
      user = User.find(session[:user_id])
      invitations = user.invitations.map(&:attended_event_id)
      return link_to 'Unattend event', a, method: :delete, class: b if invitations.include?(event.id)
      return link_to 'Attend event', c, method: :post, class: 'btn btn-xs btn-primary' if invitations.include?(event.id)
    end
    nil
  end

  def edit_link(event)
    return link_to 'Edit this event', edit_event_path(event), class: 'btn btn-xs btn-primary' if session[:user_id]
  end

  def delete_link(event)
    c = { confirm: 'Are you sure you want to delete the event?' }
    b = event_path(event)
    link_to('Delete this event', b, method: :delete, data: c, class: 'btn btn-xs btn-danger') if session[:user_id]
  end
end
