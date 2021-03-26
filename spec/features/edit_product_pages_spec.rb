require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => 'test3@email.com'
    fill_in 'user_password', :with => 'Password1!'
    fill_in 'user_password_confirmation', :with => 'Password1!'
    click_on 'commit'
    product = Product.create(:name => 'Hamburger', :country => 'Hamburg', :price => 5.99)
    visit product_path(product.id)
    click_on 'Adjust Product'
    fill_in 'Name', :with => 'Cheeseburger'
    click_on 'Update Product'
    expect(page).to have_content 'Cheeseburger'
  end
end