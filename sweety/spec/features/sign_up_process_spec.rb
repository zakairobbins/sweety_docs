require 'spec_helper'

describe "the signup process", :type => :feature do
  it "signs me in" do
    new_user = build(:user)
    visit '/'
    click_link 'sign up'
    fill_in 'User name', :with => new_user.name
    fill_in 'Password', :with => new_user.password
    click_button 'Submit'
    expect(current_path).to eq('/welcome/index')
    expect(page).to have_content(new_user.name)
  end
end
