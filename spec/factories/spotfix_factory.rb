FactoryGirl.define do
  factory :spotfix do
    association :leader, factory: :user
    sequence(:name) { |n| "Fixie ##{n}"}
    description "short description"
    fix_date { 1.day.from_now }
  end
end
