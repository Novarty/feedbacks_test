require "rails_helper"

feature "Send feedbacks" do
  it "Should have the right title" do
    visit '/users/feedbacks/new'
    expect(page).to have_title("Send feedback")
  end

  it "Should have the right content" do
    visit '/users/feedbacks/new'
    expect(page).to have_content("Full name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Message")
  end
end
