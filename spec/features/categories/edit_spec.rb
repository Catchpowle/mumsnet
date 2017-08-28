require 'rails_helper'

RSpec.feature 'When a user tries to edit a category', type: :feature do
  given(:category) { create(:category) }

  context 'when signed in' do
    background do
      log_in
      visit category_path(category)
      click_link 'Edit'
    end

    context 'with valid details' do
      scenario 'they see a category updated notice' do
        fill_in 'Title', with: 'updated_category'
        click_button 'Update Category'

        expect(page).to have_css(
          '.flash.notice',
          text: 'Category was successfully updated'
        )
      end
    end

    context 'with invalid details' do
      scenario 'they see an error message' do
        fill_in 'Title', with: ''
        click_button 'Update Category'

        expect(page).to have_css(
          '#error_explanation',
          text: 'prohibited this category from being saved'
        )
      end
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
