require 'spec_helper'

describe "recording readings", :type => :feature do
  it "navigates to readings#new" do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit '/'
    click_link 'Record a reading'
    expect(current_path).to eq('/readings/new')
  end

  it 'creates up to 4 new readings' do
  	user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit '/readings/new'
    fill_in 'My blood glucose level is', :with => 1
    click_button 'Enter'
    expect(current_path).to eq(root_path)
  end

  it 'does not create more than 4 daily readings' do
  	user = create(:user)
    4.times do
    	create(:reading, user_id: user.id)
    end
    page.set_rack_session(user_id: user.id)
    visit '/readings/new'
    fill_in 'My blood glucose level is', :with => 1
    click_button 'Enter'
    expect(current_path).to eq('/readings')
    expect(page).to have_content("Sorry, we couldn't save your reading because:")
  end
end
