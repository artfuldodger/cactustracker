
require 'rails_helper'

RSpec.describe 'signing up and signing in', type: :system do
  it 'lets you sign up and sign in' do
    visit '/'
    expect(page).to have_content 'Welcome to Cactus Tracker!'
    click_on 'Sign up'
    expect(page).to have_content 'Password confirmation'
    fill_in 'Name', with: 'Maggie'
    fill_in 'Email', with: 'maggie@example.com'
    fill_in 'Password', with: 'Hunter2!'
    fill_in 'Password confirmation', with: 'Hunter2!'
    click_button 'Sign up'
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'

    # Could do fancy email stuff here
    User.last.confirm

    click_on 'Log in'
    fill_in 'Email', with: 'maggie@example.com'
    fill_in 'Password', with: 'Hunter2!'
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end
end
