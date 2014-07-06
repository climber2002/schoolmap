require 'spec_helper'

describe Api::V1::CitiesController do
  
  describe "#index" do
    let(:province) { Province.first }
    let(:url) { "/api/v1/provinces/#{province.id}/cities.json" }

    before :each do
      get url, 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'

      it "should return a success response" do
        expect(response).to be_success
      end

      it "should get all cities of the province" do
        json = JSON.parse(response.body)
        expect(json.size).to be_greater_than 0
      end

      it "should only return id and name of the city" do
        json = JSON.parse(response.body)
        city = json.first
        expect(city.keys.size).to eq 2
        expect(city['id']).not_to be_nil
        expect(city['name']).not_to be_nil
      end
    end
  end
end