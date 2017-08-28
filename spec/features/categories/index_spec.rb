require 'rails_helper'

RSpec.feature 'When a user tries to visit the home page', type: :feature do
  background do
    create_list(:category, 2)
  end

  context 'when signed in' do
    background do
      log_in
    end

    scenario 'they see a list of categories' do
      Category.all.each do |category|
        expect(page).to have_content(category.title)
      end
    end
  end

  context 'when not signed in' do
    background do
      visit root_path
    end

    scenario 'they are redirected to the sign up page' do
      expect(page).to have_css(
        'h1',
        text: 'Sign Up'
      )
    end
  end
end
