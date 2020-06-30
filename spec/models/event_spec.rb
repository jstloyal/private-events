require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.new(name: 'Adetayo') }
  let(:event) { Event.new(description: 'Birthday', creator_id: 1, date: '2020-21-09') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  describe 'event associations' do
    it 'is associated to a user' do
      expect(event).to respond_to(:creator)
    end

    it 'event has many invitations' do
      expect(event).to respond_to(:invitations)
    end

    it 'event has many attendes' do
      expect(event).to respond_to(:attendees)
    end
  end

  describe 'event validations' do
    it 'must have a date' do
      expect(event).to be_valid
    end

    it 'is not valid without a date' do
      event.date = nil
      expect(event).not_to be_valid
    end

    it 'must have a location' do
      expect(event).to be_valid
    end

    it 'is not valid without a location' do
      event.location = nil
      expect(event).not_to be_valid
    end

    it 'must have a description' do
      expect(event).to be_valid
    end

    it 'is not valid without a description' do
      event.description = nil
      expect(event).not_to be_valid
    end
  end
end
