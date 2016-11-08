require 'spec_helper'

describe "the signout process", :type => :feature do
  it "signs me out" do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit '/'
    click_link "#{user.name}"
    expect(current_path).to eq(root_path)
    expect(page).to have_content
  end
end
