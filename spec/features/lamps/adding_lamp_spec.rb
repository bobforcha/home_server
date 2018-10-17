RSpec.feature "Adding a new lamp", js: true do
  scenario "with valid attributes" do
    visit root_path
    click_link "Add Lamp"
    fill_in "Name", with: lamp.name
    fill_in "IP Address", with: lamp.ip_address
    click_button "Create Lamp"

    expect(page).to have_content("Lamp added")
    expect(page).to have_content lamp.name
    expect(page).to have_content lamp.status
  end
end
