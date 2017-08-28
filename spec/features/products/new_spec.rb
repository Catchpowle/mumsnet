require 'rails_helper'

RSpec.feature 'When a user tries to create a new product', type: :feature do
  context 'when signed in' do
    background do
      log_in
      create_list(:category, 2)
      click_link 'New Product'
    end

    context 'with valid details' do
      scenario 'they see a product created notice' do
        fill_product_form(
          categories: [Category.first.title, Category.second.title]
        )
        click_button 'Create Product'

        expect(page).to have_css(
          '.flash.notice',
          text: 'Product was successfully created'
        )
      end
    end

    context 'with invalid details' do
      scenario 'they see an error message' do
        click_button 'Create Product'

        expect(page).to have_css(
          '#error_explanation',
          text: 'prohibited this product from being saved'
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
