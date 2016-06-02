require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(6) }

    trait :invalid do
      name { nil }
    end
  end
end
