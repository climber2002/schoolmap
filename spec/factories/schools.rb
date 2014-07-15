# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    zipcode { Faker::Address.zip }
    phone_number { Faker::PhoneNumber.cell_phone }
    director { Faker::Name.name }
    email { Faker::Internet.email }
    website { Faker::Internet.domain_name }
    grade { Grade.all.sample }
    category { Category.all.sample }
    city { City.all.sample }
    geom { City.random_point_in(city) }
    capacity { rand(1000) }
  end
end
