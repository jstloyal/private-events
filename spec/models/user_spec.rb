require 'rails_helper'

RSpec.describe 'User Model', type: :model do
  let(:user) { User.new(name: 'Tayo') }
  let(:event) { Event.new(description: 'Test event', creator_id: 1, date: '2020-02-10') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  context 'Validation test' do
    it 'ensures name presence' do
      user = User.new(name: 'username').save
      expect(user).to eq(true)
    end

    it 'ensures name presence' do
      user = User.new(name: '').save
      expect(user).to eq(false)
    end

    it 'ensures name entered is 3 or more character' do
      user = User.new(name: 'ab').save
      expect(user).to eq(false)
    end
  end

  describe 'New user page', type: :system do
    describe 'Contents of the signup page' do
      it 'shows the right content in the signup page' do
        visit new_user_path
        expect(page).to have_content('Sign up')
      end
    end

    describe 'Contents of the index page' do
      it 'shows the right content in the index page' do
        visit events_path
        expect(page).to have_content('Listing all Events')
      end
    end
  end

  describe 'associations' do
    it 'has many invitations' do
      expect(user).to respond_to(:invitations)
    end

    it 'has many attended_events' do
      expect(user).to respond_to(:attended_events)
    end
  end

  describe 'validations' do
    it 'must have a name' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end
  end
end
