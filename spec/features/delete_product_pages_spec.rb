require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    product = Product.create(:name => 'Hamburger', :country => 'Hamburg', :price => 5.99)
    visit product_path(product.id)
    click_on 'Adjust Product'
    click_on 'Delete Product'
    expect(page).to have_no_content 'Hamburger'
  end
end