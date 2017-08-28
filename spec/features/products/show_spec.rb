require 'rails_helper'

RSpec.feature 'When a user tries to visit a product show page', type: :feature do
  given(:product) { create(:product) }
  given(:category) { create(:category, products: [product]) }

  context 'when signed in' do
    background do
      log_in
      visit category_path(category)
      click_link product.title
    end

    scenario 'they see the product info' do
      expect(page).to have_content(product.title)
      expect(find('img')['src']).to have_content(product.image)
      expect(page).to have_content(product.created_at.strftime('%D'))
      expect(page).to have_content(product.user.username)
      expect(page).to have_content(product.description)
    end

    scenario 'they see a list of categories that product belongs to' do
      expect(page).to have_content(category.title)
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
