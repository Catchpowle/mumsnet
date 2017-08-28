require 'rails_helper'

RSpec.feature 'When a user logs in', type: :feature do
  context 'with valid details' do
    scenario 'they see a logged in notice' do
      log_in(username: 'Test User', password: 'password')

      expect(page).to have_content('Logged in!')
    end
  end

  context 'with invalid details' do
    scenario 'the see an error message' do
      log_in(username: '', password: '')

      expect(page).to have_content('Invalid email or password')
    end
  end
end
