require 'factory_girl_rails'

users = [FactoryGirl.create(:user, name: "Admin", email: "admin@example.com", password: "tibiang12")]
users += FactoryGirl.create_list(:user, 3, password: "123456")
users.each do |user|
  ideas = FactoryGirl.create_list(:idea, 3, user: user)
  ideas.each do |idea|
    FactoryGirl.create_list(:note, 5, idea: idea)
    FactoryGirl.create_list(:task, 5, idea: idea)
  end
end