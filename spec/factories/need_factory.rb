FactoryGirl.define do
  factory :need do
    spotfix
    sequence(:name) { |n| "Need #{n}"}
    count 10
    description "lots to clean"
  end
end
