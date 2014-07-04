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

  describe "#in_categories" do
    let(:category_religieux) { Category.find_by(name: 'Religieux') }
    let(:category_public) { Category.find_by(name: 'Public') }
    let(:category_prive) { Category.find_by(name: 'Privé')}
    let!(:school_public ) { FactoryGirl.create(:school, category: category_public) }
    let!(:school_religieux) { FactoryGirl.create(:school, category: category_religieux) }
    let!(:school_prive) { FactoryGirl.create(:school, category: category_prive) }

    context "pass multiple category_id" do 
      subject { School.in_categories([category_religieux.id, category_public.id]) }

      it "should include religieux school" do
        expect(subject).to include school_religieux
      end

      it "should include public school" do 
        expect(subject).to include school_public
      end

      it "should not include prive school" do
        expect(subject).not_to include school_prive
      end
    end

    context "pass one category_id" do 
      subject { School.in_categories([category_religieux.id]) }

      it "should include religieux school" do
        expect(subject).to include school_religieux
      end

      it "should not include public school" do 
        expect(subject).not_to include school_public
      end

      it "should not include prive school" do
        expect(subject).not_to include school_prive
      end
    end
  end
end
