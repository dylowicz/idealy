require 'faker'

FactoryGirl.define do
  factory :idea do
    user
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    status { "new" }

    trait :invalid do
      title { nil }
    end
  end
end