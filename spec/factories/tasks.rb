require 'faker'

FactoryGirl.define do
  factory :task do
    idea
    title { Faker::Lorem.sentence }
    completed { false }
    due_to { 1.week.from_now }
  end
end
