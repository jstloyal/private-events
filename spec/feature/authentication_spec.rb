require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    User.create(name: 'Akanmu')
    visit '/sessions/new'
  end

  it 'show Signed in as Akanmu in the navbar after log in' do
    fill_in 'Enter your name', with: 'Akanmu'
    click_button 'Log in'
    expect(page).to have_content('Signed in as Akanmu')
  end

  it 'show Sign out in the navbar after log in' do
    fill_in 'Enter your name', with: 'Akanmu'
    click_button 'Log in'
    expect(page).to have_content('Sign out')
  end

  it 'show New event in the navbar after log in' do
    fill_in 'Enter your name', with: 'Akanmu'
    click_button 'Log in'
    expect(page).to have_content('New event')
  end
end
