RSpec.feature "Authenticating a User" do
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
end
