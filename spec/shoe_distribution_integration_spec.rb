require("spec_helper")

describe("As a user, I want to be able to add, update, delete and list shoe stores.", :type => :feature) do
  it "allows the user to view and manage stores" do
    visit('/')
    click_on('/stores')
    fill_in('/store_name', :with => "Shoes R Us")
    click_on('/add new store')
    expect(page).to have_content("Shoes R Us")
  end
end
