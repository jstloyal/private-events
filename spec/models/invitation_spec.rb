require 'rails_helper'

RSpec.describe Invitation, type: :model do
  let(:user) { User.new(name: 'Adetayo') }
  let(:event) { Event.new(description: 'Birthday', creator_id: 1, date: '2020-21-09') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  describe 'Associations in Invitation' do
    it 'invitation belongs to attendee' do
      expect(invitation).to respond_to(:attendee)
    end

    it 'belongs to attended_event' do
      expect(invitation).to respond_to(:attended_event)
    end
  end

  describe 'Validation of an Invitation' do
    it 'has uniqueness on columns attendee_id and attended_event_id' do
      Invitation.create(attendee_id: 1, attended_event_id: 1)
      expect(invitation).not_to be_valid
    end
  end
end
