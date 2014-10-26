FactoryGirl.define do
  factory :invite do
    spotfix
    user
    association :invitee, factory: :user
  end
end
