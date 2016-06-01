require 'faker'

FactoryGirl.define do
  factory :idea do
    user
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    status { "new" }
  end
end