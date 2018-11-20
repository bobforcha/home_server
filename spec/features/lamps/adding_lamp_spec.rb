RSpec.feature "Adding a new lamp", js: true do
  let(:user) { User.create(name: "Test", email: "test@example.com", password: "password") }
  let(:lamp) { Lamp.new(name: "Test Lamp", ip_address: "1.1.1.1") }

  before { sign_in user }

  scenario "with valid attributes" do
    visit root_path
    click_link "Add Lamp"
    fill_in "Name", with: lamp.name
    fill_in "IP Address", with: lamp.ip_address
    click_button "Create Lamp"

    expect(page).to have_content("Lamp successfully added!")
    expect(page).to have_content lamp.name
    expect(page).to have_content lamp.status
  end

  context "with invalid attributes" do
    scenario "with invalid name" do
      visit root_path
      click_link "Add Lamp"
      fill_in "Name", with: ""
      fill_in "IP Address", with: lamp.ip_address
      click_button "Create Lamp"

      expect(page).to have_content("Lamp not created!")
      expect(page).to have_button("Create Lamp")
    end

    scenario "with invalid name" do
      visit root_path
      click_link "Add Lamp"
      fill_in "Name", with: "New Name"
      fill_in "IP Address", with: "not valid"
      click_button "Create Lamp"

      expect(page).to have_content("Lamp not created!")
      expect(page).to have_button("Create Lamp")
    end
  end
end
