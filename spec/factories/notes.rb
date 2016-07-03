require 'faker'

FactoryGirl.define do
  factory :note do
    idea
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end
