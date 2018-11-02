RSpec.feature "Viewing a user's role", js: true do
  let(:bob)   { User.create(name: "Bob", email: "bob@example.com", password: "password", admin: true) }
  let(:judy)  { User.create(name: "Judy", email: "judy@example.com", password: "password") }

  before do
    visit root_path
    click_link "Sign in"
  end

  scenario "when user is admin" do
    fill_in "Email", with: bob.email
    fill_in "Password", with: bob.password
    click_button "Log in"

    click_link "User Profile"

    expect(page).to have_content(bob.name)
    expect(page).to have_content(bob.email)
    expect(page).to have_content("Role: admin")
  end

  scenario "when user is guest" do
    fill_in "Email", with: judy.email
    fill_in "Password", with: judy.password
    click_button "Log in"

    click_link "User Profile"

    expect(page).to have_content(judy.name)
    expect(page).to have_content(judy.email)
    expect(page).to have_content("Role: guest")
  end
end
