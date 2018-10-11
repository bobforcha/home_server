RSpec.feature "User index", js: true do
  let!(:bob)  { User.create(name: "Bob") }
  let!(:judy) { User.create(name: "Judy") }

  it "lists all the users" do
    visit root_path

    expect(page).to have_content(bob.name)
    expect(page).to have_content(judy.name)
  end
end
