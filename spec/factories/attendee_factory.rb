FactoryGirl.define do
  factory :attendee do
    spotfix
    user
    trait :attended do
      attended true
    end
    trait :dropped do
      attended false
    end
    trait :confirmed do
      confirmed true
    end
    trait :unconfirmed do
      confirmed false
    end
  end
end
