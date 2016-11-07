require 'spec_helper'

describe User do
  it 'is valid with a name and password' do
		expect(build(:user)).to be_valid
  end

  it 'is invalid without a name' do
  	user = build(:user, name: nil)
  	expect(user).to have(1).errors_on(:name)
  end

  it 'is invalid without a password' do
  	user = build(:user, password: nil)
  	expect(user).to have(1).errors_on(:password)
  end

  it 'is invalid with a duplicate name' do
  	create(:user, name: 'test')
  	bad_user = build(:user, name: 'test')
  	expect(bad_user).to have(1).errors_on(:name)
  end
end
