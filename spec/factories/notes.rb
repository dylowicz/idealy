require 'faker'

FactoryGirl.define do
  factory :note do
    idea
    content { Faker::Lorem.paragraph }
  end
end
