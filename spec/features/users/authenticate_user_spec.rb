RSpec.feature "Authenticating a User", js: true do
  let(:user) { User.create(name: "Test", email: "test@example.com", password: "password") }

  before do
    visit root_path
  end

  scenario "with valid credentials" do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
  end

  scenario "without valid credentials" do
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
  end
end
