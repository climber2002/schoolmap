require 'spec_helper'

describe Api::V1::SchoolsController do
  
  describe "#create" do
    let(:url) { "/api/v1/schools.json" }

    let(:school_attrs) do 
      attrs = { name: "A school name", city_name: City.first.name, 
        grade_name: Grade.first.name, category_name: Category.first.name,
        address: "a street", geom: swap_latlng(City.first.center), zipcode: '5000', 
        director: 'director', email: 'aaa@example.com', website: 'www.aaa.com' }

      { school: attrs }
    end

    context "without random school" do
      before :each do
        post url, school_attrs.as_json
      end

      it "should return successful response" do
        expect(response).to be_success
      end

      it "should be able to create a valid school" do
        json = JSON.parse(response.body)
        expect(json['name']).to eq 'A school name'
      end
    end

    context "with random school" do

      before :each do
        Setting.random_school = true
        post url, school_attrs.as_json
      end

      it "should random school location if setting is set" do
        puts "origin: #{school_attrs}"
        puts "body: #{response.body}"
        origin_geom = school_attrs[:school][:geom]
        json = JSON.parse(response.body)
        expect(json['geom']).not_to eq origin_geom
      end

    end

  end

  def swap_latlng point
    point.to_s.sub!(/\((\d+\.\d+) (\d+.\d+)\)/) { "(#{$2} #{$1})" }
  end
end