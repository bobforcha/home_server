RSpec.feature "Signing in a User", js: true do
  let(:test_user) { User.create(name: 'Bob', email: 'bob@example.com', password: 'password') }

  scenario "with valid credentials" do
    visit root_path
    click_link "Sign in"
    fill_in 'Email', with: test_user.email
    fill_in "Password", with: test_user.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Lamps"
  end
end
