require 'faker'

FactoryGirl.define do
  factory :user do |u|
    u.name { Faker::Name.first_name }
    u.email { Faker::Internet.email }
    u.password { Faker::Internet.password(6) }
  end
end
