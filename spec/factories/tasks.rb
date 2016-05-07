require 'faker'

FactoryGirl.define do
  factory :task do |t|
    t.title { Faker::Lorem.sentence }
    t.completed { false }
    t.due_to { 1.week.from_now }
    t.idea { create(:idea) }
  end
end
