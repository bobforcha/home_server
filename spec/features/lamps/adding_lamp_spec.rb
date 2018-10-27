RSpec.feature "Adding a new lamp", js: true do
  let(:lamp) { Lamp.new(name: "Test Lamp", ip_address: "1.1.1.1") }

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

  scenario "with invalid attributes" do
    visit root_path
    click_link "Add Lamp"
    fill_in "Name", with: ""
    fill_in "IP Address", with: ""
    click_button "Create Lamp"

    expect(page).to have_content("Lamp not created!")
    expect(page).to have_button("Create Lamp")
  end
end
