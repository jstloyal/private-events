require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Adetayo') }
  let(:event) { Event.new(description: 'Birthday', creator_id: 1, date: '2020-21-09') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  describe 'associations' do
    it 'user has many events' do
      expect(user).to respond_to(:events)
    end

    it 'user has many invitations' do
      expect(user).to respond_to(:invitations)
    end

    it 'user has many attended_events' do
      expect(user).to respond_to(:attended_events)
    end
  end

  describe 'check user validations' do
    it 'user must have a name' do
      expect(user).to be_valid
    end

    it 'user not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end
  end
end
