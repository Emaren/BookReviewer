require 'rails_helper'

feature "user signs in" do
  scenario "with valid params" do
    visit "#"

    expect(page).to have_content("Sign Up")
  end

  scenario "missing email address" do
    visit "/users/sign_in"

    expect(page).to have_content("Sign In")
  end

end
