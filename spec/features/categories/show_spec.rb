require 'rails_helper'

RSpec.feature 'When a user tries to visit a category show page', type: :feature do
  given(:product) { create(:product) }
  given!(:category) { create(:category, products: [product]) }

  context 'when signed in' do
    background do
      log_in
      click_link category.title
    end

    scenario 'they see the category info' do
      expect(page).to have_content(category.title)
    end

    scenario 'they see a list of products belonging to that category' do
      expect(page).to have_content(product.title)
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
