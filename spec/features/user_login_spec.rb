require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  scenario "User can login into their account" do
    User.create!({name: "Lucas Wong", email: "lucas@mail.com", password: "password", password_confirmation: "password"})

    visit root_path

    expect(page).to have_text "Login"

    page.find_link('Login').click

    expect(page).to have_css "section.login-page"

    fill_in "email", with: "lucas@mail.com"
    fill_in "password", with: "password"

    # save_screenshot
    click_button "Submit"
    # save_screenshot

    expect(page).to have_text "lucas@mail.com"
    expect(page).to have_text "Logout"
  end
end
