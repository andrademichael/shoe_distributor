require("spec_helper")

describe("As a user, I want to be able to add, update, delete and list shoe stores.", :type => :feature) do
  it "allows the user to view and manage stores" do
    visit('/')
    click_on('View Shoe Stores:')
    fill_in('Store Name:', :with => "Shoes R Us")
    fill_in('Store Address:', :with => "123 Shoe Dr")
    click_on('Add store')
    expect(page).to have_content("Shoes R Us")
    expect(page).to have_content("123 Shoe Dr")
  end
end
