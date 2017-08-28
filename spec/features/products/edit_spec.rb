require 'rails_helper'

RSpec.feature 'When a user tries to edit a product', type: :feature do
  given(:product) { create(:product) }

  context 'when signed in' do
    background do
      log_in
      visit product_path(product)
      click_link 'Edit'
    end

    context 'with valid details' do
      scenario 'they see a product updated notice' do
        fill_product_form(title: 'Updated product')
        click_button 'Update Product'

        expect(page).to have_css(
          '.flash.notice',
          text: 'Product was successfully updated'
        )
      end
    end

    context 'with invalid details' do
      scenario 'they see an error message' do
        fill_product_form(title: '')
        click_button 'Update Product'

        expect(page).to have_css(
          '#error_explanation',
          text: 'prohibited this product from being saved'
        )
      end
    end
  end

  context 'when not signed in' do
    background do
      visit product_path(product)
    end

    scenario 'they are redirected to the sign up page' do
      expect(page).to have_css(
        'h1',
        text: 'Sign Up'
      )
    end
  end
end
