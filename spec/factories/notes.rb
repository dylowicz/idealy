require 'faker'

FactoryGirl.define do
  factory :note do |n|
    n.title { Faker::Lorem.sentence }
    n.content { Faker::Lorem.paragraph }
    n.type { "thought" }
    n.idea { create(:idea) }
  end
end
