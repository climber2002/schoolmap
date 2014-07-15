require 'spec_helper'

describe SchoolsHelper do
  
  context "info_window_content_for_school" do
    let(:school) { FactoryGirl.create(:school) }
    subject { info_window_content_for_school(school) }

    it "should contain the school name" do 
      expect(subject).to include("<h4>#{school.name.html_safe}</h4>")
    end
  end

  context "marker_img_tag_for_grade" do 
    let(:college_grade) { Grade.find_by(name: 'College') }
    subject { marker_img_tag_for_grade(college_grade) }

    it "should has letter C for grade college" do
      expect(subject).to include("C")
    end

    it "should has red color" do
      expect(subject).to include("red")
    end

    it "should contain images path" do
      expect(subject).to include("images")
    end
  end

  describe "#total_capacity" do 
    let!(:school1) { FactoryGirl.create(:school, capacity: 5000) }
    let!(:school2) { FactoryGirl.create(:school, capacity: 10000) }
    let(:all_schools) { School.all }
    subject { total_capacity(all_schools) }

    it "should have two schools" do
      expect(all_schools.count).to eq 2
    end

    it "should format correctly" do
      expect(subject).to eq("15 000")
    end
  end
end