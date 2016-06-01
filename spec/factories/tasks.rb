require 'faker'

FactoryGirl.define do
  factory :task do
    idea
    title { Faker::Lorem.sentence }
    completed { false }
  end
end
