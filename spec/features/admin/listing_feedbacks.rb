require "rails_helper"

def sign_in(email, password)
  visit new_admin_session_path
  fill_form(:admin, email: email, password: password)
  click_button "Sign in"
end

describe "Listing feedbacks right title" do
  let(:admin) { create :admin }
  it "Should have the right title" do
    sign_in(admin.email, admin.password)
    visit '/admins/feedbacks'
    expect(page).to have_title("Listing feedbacks")
  end
end

describe "Listing feedbacks right content" do
  let(:admin) { create :admin }
  it "Should have the right content" do
    sign_in(admin.email, admin.password)
    visit '/admins/feedbacks'
    expect(page).to have_content("Full name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Message")
  end
end
