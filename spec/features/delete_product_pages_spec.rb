require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => 'test3@email.com'
    fill_in 'user_password', :with => 'Password1!'
    fill_in 'user_password_confirmation', :with => 'Password1!'
    click_on 'commit'
    product = Product.create(:name => 'Hamburger', :country => 'Hamburg', :price => 5.99)
    visit product_path(product.id)
    click_on 'Adjust Product'
    click_on 'Delete Product'
    expect(page).to have_no_content 'Hamburger'
  end
end