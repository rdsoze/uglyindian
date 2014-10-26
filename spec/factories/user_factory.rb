FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}"}
    sequence(:email) { |n| "mail#{n}@tui.com"}
    gender { ["male", "female"].sample }
    city
  end
end
