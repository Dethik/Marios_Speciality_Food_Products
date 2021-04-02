require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    User.create(:email => "generic_admin@email.com", :password => "@dminzRul3", :admin => true)
    visit '/'
    fill_in 'user_email', :with => 'generic_admin@email.com'
    fill_in 'user_password', :with => '@dminzRul3'
    click_on 'Log in'
    product = Product.create(:name => 'Hamburger', :country => 'Hamburg', :price => 5.99)
    visit product_path(product.id)
    click_on 'Adjust Product'
    click_on 'Delete Product'
    expect(page).to have_no_content 'Hamburger'
  end
end