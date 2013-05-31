FactoryGirl.define do
  factory :project do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence(10) }
    latitude 10.5
    longitude 22.3
    gmaps true
    user
  end
end