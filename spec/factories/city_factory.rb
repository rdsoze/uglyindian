FactoryGirl.define do
  factory :city do
    sequence(:name) { |n| "City #{n}"}
    latitude 12.9716
    longitude 77.5946
  end
end
