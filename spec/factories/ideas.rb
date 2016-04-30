require 'faker'

FactoryGirl.define do
  factory :idea do |i|
    i.title { Faker::Lorem.sentence }
    i.description { Faker::Lorem.paragraph }
    i.status { "new" }
    i.score { 0 }
  end
end