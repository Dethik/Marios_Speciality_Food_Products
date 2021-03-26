require 'rails_helper'

describe "the user edit process" do
  it "edits a user account" do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', :with => 'test3@email.com'
    fill_in 'user_password', :with => 'Password1!'
    fill_in 'user_password_confirmation', :with => 'Password1!'
    click_on 'commit'
    click_on 'Profile'
    fill_in 'user_email', :with => 'test3@fakemail.com'
    fill_in 'user_current_password', :with => 'Password1!'
    click_on 'Update'
    expect(page).to have_content 'test3@fakemail.com'
  end
end