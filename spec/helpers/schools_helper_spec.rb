require 'spec_helper'

describe SchoolsHelper do
  
  context "info_window_content_for_school" do
    let(:school) { FactoryGirl.create(:school) }
    subject { info_window_content_for_school(school) }

    it "should contain the school name" do 
      expect(subject).to include("<h4>#{school.name}</h4>")
    end

  end
end