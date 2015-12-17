require "rails_helper"

feature "Accounts" do
  scenario "creating an account" do
    visit subscribem.root_path
    click_link "Account Sign up"
    fill_in "Name", :with => "Test"
    fill_in "Email", :with => "subscribem@example.com"
    fill_in "Password", :with => "welcome"
    fill_in "Password confirmation", :with => "welcome"
    click_button "Create Account"
    success_message = "Your account has been successfully created."
    expect(page).to have_content(success_message)
    expect(page).to have_content("Signed in as subscribem@example.com")
  end
end