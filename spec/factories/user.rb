FactoryGirl.define do
  factory :user do
    email       { Faker::Internet.email }
    password    'password'
    name  { Faker::Internet.user_name }
  end
end