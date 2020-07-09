require 'rails_helper'

RSpec.describe 'My main menu', type: :system do
  describe 'Contents of the index page' do
    it 'shows the right content in the index page' do
      visit events_path
      sleep(5)
      expect(page).to have_content('Listing all Events')
    end

    it 'shows the right content in the index page' do
      visit events_path
      expect(page).to have_content('Sign in')
    end

    it 'shows the right content in the index page' do
      visit events_path
      expect(page).to have_content('New user')
    end
  end
end
