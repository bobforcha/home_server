RSpec.feature "User index", js: true do
  let!(:user) { User.create(name: "Bob") }

  it "lists all the users" do
    visit root_path

    expect(page).to have_content(user.name)
  end
end
