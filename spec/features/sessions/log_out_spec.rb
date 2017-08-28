require 'rails_helper'

RSpec.feature 'When a user logs out', type: :feature do
  scenario 'they see a logged out notice' do
    log_in
    click_link 'Log out'

    expect(page).to have_content('Logged out')
  end
end
