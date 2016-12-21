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
describe("As a user, I want to be able to add, update, delete and list shoe brands.", :type => :feature) do
  it "allows the user to view and manage brands" do
    visit('/')
    click_on('View Shoe Brands:')
    fill_in('Brand Name:', :with => "Best Shoes")
    fill_in('Brand Logo:', :with => "The Swash")
    click_on('Add brand')
    expect(page).to have_content("Best Shoes")
    expect(page).to have_content("The Swash")
  end
end

describe("As a user, I want to be able to add existing brands to one or more stores") do
  it "allows user to link brands with stores after both have been created", :type => :feature do
    visit("/")
    click_on('View Shoe Brands:')
    fill_in('Brand Name:', :with => "Best Shoes")
    fill_in('Brand Logo:', :with => "The Swash")
    click_on('Add brand')
    click_on('Home')
    click_on('View Shoe Stores:')
    fill_in('Store Name:', :with => "Shoes R Us")
    fill_in('Store Address:', :with => "123 Shoe Dr")
    click_on('Add store')
    click_on('Lethargo - 999 99th Pl')
    select 'Best Shoes', :from => 'brand_list'
    click_on('Sell Brand Here!')
    expect(page).to have_content('Best Shoes sold here!')
  end
end
