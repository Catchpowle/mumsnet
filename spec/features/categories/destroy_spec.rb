require 'rails_helper'

RSpec.feature 'When a user tries to destroy a category', type: :feature do
  given(:category) { create(:category) }

  context 'when signed in' do
    background do
      log_in
      visit category_path(category)
      click_link 'Delete'
    end

    scenario 'they see a category deleted notice' do
      expect(page).to have_css(
        '.flash.notice',
        text: 'Category was successfully deleted'
      )
    end
  end

  context 'when not signed in' do
    background do
      visit category_path(category)
    end

    scenario 'they are redirected to the sign up page' do
      expect(page).to have_css(
        'h1',
        text: 'Sign Up'
      )
    end
  end
end
