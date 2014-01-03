require 'spec_helper'

feature 'User Signup' do

  scenario "user signs up successfully"

  def signup
    click_link "Sign up", match: :first

    fill_in "user_name", with: "John Doe"
    fill_in "user_email", with: "john@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_button "Sign up"
  end

end
