require 'spec_helper'

describe SchoolsController do 

  let(:url) { "/schools.json" }

  context "create" do
    let(:school_attrs) do 
      attrs = { name: "A school name", city_name: City.first.name, 
        grade_name: Grade.first.name, category_name: Category.first.name,
        address: "a street", geom: City.first.center, zipcode: '5000', 
        director: 'director', email: 'aaa@example.com', website: 'www.aaa.com' }

      { school: attrs }
    end

    it "should be able to create a valid school" do
      puts "params: #{school_attrs.as_json}"
      post url, school_attrs.as_json
      expect(response.response_code).to eq 200
      puts "body: #{response.body}"
      json = JSON.parse(response.body)
      expect(json['name']).to eq 'A school name'
    end
  end

end