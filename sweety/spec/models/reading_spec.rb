require 'spec_helper'

RSpec.describe Reading, type: :model do

	it 'is valid with an integer value for level' do
		expect(create(:reading)).to be_valid
	end

	it 'is invalid with a non-integer value' do
		expect(build(:reading, level: 1.5)).to have(1).errors_on(:level)
	end

	it 'sets its date value to the current date before saving' do
		expect(create(:reading).date).to be_eql(Date.today)
	end

  it 'does not allow more than 4 entries per user per day' do
  	user = create(:user)
  	create(:reading, user: user)
  	create(:reading, user: user)
  	create(:reading, user: user)
  	create(:reading, user: user)
  	expect(build(:reading, user: user)).to have(1).errors_on(:user_quota)
  end
end
