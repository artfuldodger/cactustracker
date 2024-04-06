require 'rails_helper'

RSpec.describe 'plant crud', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in(user)
  end

  it 'lets you sign up and sign in' do
    visit "/users/#{user.slug}"
    expect(page).to have_content "#{user.name}'s Plants"

    click_on 'Add a new plant'

    fill_in 'Nickname', with: 'Joe'
    fill_in 'Variety', with: 'Bridgesii'
    fill_in 'Source', with: 'Reddit'
    fill_in 'Description', with: "He's a beaut!"
    click_on 'Create Plant'

    expect(page).to have_content 'Plant was successfully created.'
    expect(page).to have_content 'Joe'

    click_on 'Edit Details'
    fill_in 'Nickname', with: 'Joe!'
    click_on 'Update Plant'

    expect(page).to have_content 'Plant was successfully updated.'
    expect(page).to have_content 'Joe!'

    accept_confirm 'Are you sure? This cannot be undone.' do
      click_on 'Delete this plant'
    end
    expect(page).to have_content 'Plant was successfully destroyed.'
    expect(page).to have_content "#{user.name}'s Plants"
  end
end
