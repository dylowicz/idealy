require 'faker'

FactoryGirl.define do
  factory :note do |n|
    n.content { Faker::Lorem.paragraph }
    n.idea { create(:idea) }
  end
end
