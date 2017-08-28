require 'rails_helper'

RSpec.feature 'When a user signs up', type: :feature do
  context 'with valid details' do
    scenario 'they see a signed up notice' do
      sign_up(username: 'Test User', password: 'password')

      expect(page).to have_content('Signed up!')
    end
  end

  context 'with invalid details' do
    scenario 'the see an error message' do
      sign_up(username: '', password: '')

      expect(page).to have_content('prevented you from signing up')
    end
  end
end
