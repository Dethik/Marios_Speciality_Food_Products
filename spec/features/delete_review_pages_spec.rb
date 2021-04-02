require 'rails_helper'

describe "the delete a review process" do
  it "deletes a review" do
    User.create(:email => "generic_admin@email.com", :password => "@dminzRul3", :admin => true)
    visit '/'
    fill_in 'user_email', :with => 'generic_admin@email.com'
    fill_in 'user_password', :with => '@dminzRul3'
    click_on 'Log in'
    product = Product.create(:name => 'Hamburger', :country => 'Hamburg', :price => 5.99)
    visit product_path(product.id)
    click_on 'Add Review'
    fill_in 'Author', :with => 'Dinkleburg'
    fill_in 'Content body', :with => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam molestie vel orci eu fermentum. Morbi mi metus, luctus ac sapien vitae, accumsan vehicula tortor.'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    click_on 'Delete'
    expect(page).to have_no_content 'Dinkleburg'
  end
end