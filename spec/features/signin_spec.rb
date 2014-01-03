require 'spec_helper'

feature "Users can log in and out" do
  before { FactoryGirl.create(:user,  email: "test@test.com", password: "password", password_confirmation: "password") }

  scenario "User logs in with valid password" do

    visit root_path
    click_on "Login"
    login_with_credentials("test@test.com", "password")
    user_sees_flash_method("Signed in successfully")

  end

  scenario "User logs in with invalid password" do

    visit root_path
    click_on "Login"
    login_with_credentials("test@test.com", "bad_password")
    user_sees_flash_method("Invalid")

  end

end

def login_with_credentials(email, password)
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_on "Sign in"
end

def user_sees_flash_method(message)
  expect(page).to  have_content message
end

