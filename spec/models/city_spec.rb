require 'spec_helper'

describe City do

  describe "::has_point" do
    let(:city) { City.first }

    it "should be able to find the city that has point" do
      point = City.random_point_in(city)
      expect(City.has_point(point).first).to eq city
    end
  end
end
