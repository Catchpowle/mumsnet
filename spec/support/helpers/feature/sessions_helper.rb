module Helpers
  module Feature
    def log_in(username: 'Test User', password: 'password')
      create(:user, username: 'Test User')
      visit login_path
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    def sign_up(username: 'Test User', password: 'password')
      visit signup_path
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end
  end
end
