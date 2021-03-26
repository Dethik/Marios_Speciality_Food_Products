require 'rails_helper'

# describe "the add a product process" do
#   it "adds a new product" do
#     visit products_path
#     click_link 'Add Produce to our list!'
#     fill_in 'Name', :with => 'Home Stuff'
#     fill_in 'Country', :with => 'USA'
#     fill_in 'Price', :with => '12.99'
#     click_on 'Create Product'
#     expect(page).to have_content 'Home Stuff'
#   end

#   it "gives error when no name is entered" do
#     visit new_product_path
#     click_on 'Create Product'
#     expect(page).to have_content 'errors'
#   end
# end