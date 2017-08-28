require 'rails_helper'

RSpec.feature 'When a user tries to create a new category', type: :feature do
  context 'when signed in' do
    background do
      log_in
      click_link 'New Category'
    end

    context 'with valid details' do
      scenario 'they see a category created notice' do
        fill_in 'Title', with: 'New Category'
        click_button 'Create Category'

        expect(page).to have_css(
          '.flash.notice',
          text: 'Category was successfully created'
        )
      end
    end

    context 'with invalid details' do
      scenario 'they see an error message' do
        click_button 'Create Category'

        expect(page).to have_css(
          '#error_explanation',
          text: 'prohibited this category from being saved'
        )
      end
    end
  end

  context 'when not signed in' do
    background do
      visit new_category_path
    end

    scenario 'they are redirected to the sign up page' do
      expect(page).to have_css(
        'h1',
        text: 'Sign Up'
      )
    end
  end
end
