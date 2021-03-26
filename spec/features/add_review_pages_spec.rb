require 'rails_helper'

describe "the add a review process" do
  it "makes a review" do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => 'test3@email.com'
    fill_in 'user_password', :with => 'Password1!'
    fill_in 'user_password_confirmation', :with => 'Password1!'
    click_on 'commit'
    product = Product.create(:name => 'Hamburger', :country => 'Hamburg', :price => 5.99)
    visit product_path(product.id)
    click_on 'Add Review'
    fill_in 'Author', :with => 'Dinkleburg'
    fill_in 'Content body', :with => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam molestie vel orci eu fermentum. Morbi mi metus, luctus ac sapien vitae, accumsan vehicula tortor.'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Dinkleburg'
  end
end