require 'rails_helper'

RSpec.feature 'When a user tries to destroy a product', type: :feature do
  given(:product) { create(:product) }

  context 'when signed in' do
    background do
      log_in
      visit product_path(product)
      click_link 'Delete'
    end

    scenario 'they see a product deleted notice' do
      expect(page).to have_css(
        '.flash.notice',
        text: 'Product was successfully deleted'
      )
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
