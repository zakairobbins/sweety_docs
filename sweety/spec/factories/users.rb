FactoryGirl.define do
  factory :user do
  	sequence(:id) {|n| n+1}
    sequence(:name) {|n| "test_user#{n}"}
    password "password"
  end
end
