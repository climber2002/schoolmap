namespace :db do
  desc "generate school at random points"
  task :random_schools => :environment do
    School.delete_all
    
    cities = City.all
    cities.each do |city|
      num_of_schools = rand(10) # create at most 10 schools in each city
      (0..num_of_schools).each do |_|
      point = City.random_point_in(city)
        school = School.new(geom: point,
                            address: Faker::Address.street_address,
                            zipcode: Faker::Address.zip,
                            name: Faker::Company.name,
                            phone_number: Faker::PhoneNumber.cell_phone,
                            director: Faker::Name.name,
                            email: Faker::Internet.email,
                            website: Faker::Internet.domain_name,
                            grade: Grade.all.sample,
                            category: Category.all.sample,
                            city: city,
                            capacity: 500 + rand(10000)
                          )
        school.save

        puts "Created #{num_of_schools} schools for city #{city.name}"
      end
    end
  end
end