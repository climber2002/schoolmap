require 'spec_helper'

describe School do

  context "creation" do
    let(:city) { City.first }
    let(:grade) { Grade.first }
    let(:category) { Category.first }

    subject(:school) { School.new(city_name: city.name,
                  grade_name: grade.name,
                  category_name: category.name,
                  geom: city.center,
                  name: 'School') }

    before :each do
      school.save
    end

    it "should create a valid school" do      
      expect(school).to be_valid
    end

    it "should have a province auto set" do 
      expect(school.province).to eq city.province
    end
  end

  context "FactoryGirl" do 
    it "should be able to create a valid school from FactoryGirl" do
      expect(FactoryGirl.create(:school)).to be_valid
    end
  end
end
