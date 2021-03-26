require 'rails_helper'

describe "the user delete process" do
  it "deletes a user account" do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => 'test3@email.com'
    fill_in 'user_password', :with => 'Password1!'
    fill_in 'user_password_confirmation', :with => 'Password1!'
    click_on 'commit'
    click_on 'Profile'
    click_on 'Cancel my account'
    expect(page).to have_no_content 'test3@email.com'
  end
end