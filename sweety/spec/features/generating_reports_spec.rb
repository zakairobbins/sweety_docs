require 'spec_helper'

describe "generating reports", :type => :feature do
  it "navigates to reports" do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit '/'
    click_link 'View a report'
    expect(current_path).to eq('/reports/new')
  end

  it 'generates a report' do
  	user = create(:user)
  	Reading.create(level: 1, user_id: user.id)
  	Reading.create(level: 3, user_id: user.id)
    page.set_rack_session(user_id: user.id)
    visit '/reports/new'
    date = Date.today.strftime('%m%d%Y')
    find_field(id: 'report-time-range').set(date)
    click_button 'Enter'
    expect(page).to have_content("Max: 3, Min: 1, Average: 2")
  end
end
