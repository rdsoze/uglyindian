FactoryGirl.define do
  factory :photo do
    spotfix
    user
    trait :before do
      type 'BEFORE'
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'photos','before.jpg')) }
    end
    trait :after do
      type 'BEFORE'
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'photos','after.jpg')) }
    end
  end
end
