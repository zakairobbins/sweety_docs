FactoryGirl.define do
  factory :reading do
    level 1
    # date Date.today
    association :user
  end
end
