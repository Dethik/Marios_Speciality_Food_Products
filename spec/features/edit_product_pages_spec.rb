require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    User.create(:email => "generic_admin@email.com", :password => "@dminzRul3", :admin => true)
    visit '/'
    fill_in 'user_email', :with => 'generic_admin@email.com'
    fill_in 'user_password', :with => '@dminzRul3'
    click_on 'Log in'
    product = Product.create(:name => 'Hamburger', :country => 'Hamburg', :price => 5.99)
    visit product_path(product.id)
    click_on 'Adjust Product'
    fill_in 'Name', :with => 'Cheeseburger'
    click_on 'Update Product'
    expect(page).to have_content 'Cheeseburger'
  end
end