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
end