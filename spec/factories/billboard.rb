FactoryGirl.define do
  factory :billboard do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(10) }
    latitude 10.5
    longitude 22.3
    gmaps true
    user
    key "kjaasdlkj123e4124"
  end
end