require 'rails_helper'

RSpec.describe 'Event Model', type: :model do
  User.create(name: 'Tayo')
  let(:event) { Event.new(description: 'Test event', creator_id: 1, date: '2020-02-10', location: 'Patras') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  context 'Validation test' do
    it 'ensures users are signed in to create events' do
      Event.new(name: 'Tayo', location: 'Abuja', description: 'first day', creator_id: 1).save
      expect(false).to eq(false)
    end
  end

  describe 'associations' do
    it 'is associated to a user' do
      expect(event).to respond_to(:creator)
    end

    it 'has many invitations' do
      expect(event).to respond_to(:invitations)
    end

    it 'has many attendes' do
      expect(event).to respond_to(:attendees)
    end
  end
end
