require 'spec_helper'

describe Api::V1::ProvincesController do 
  
  describe "#index" do
    let(:url) { '/api/v1/provinces.json' }

    before :each do 
      get url, 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'
    end

    it "should return a success response" do
      expect(response).to be_success
    end

    it "should have 9 provinces in the body" do

      json = JSON.parse(response.body)
      puts JSON.pretty_generate(json)
      expect(json.size).to eq 9
    end

    it "should only has id and name for each province" do
      json = JSON.parse(response.body)
      province = json.first
      expect(province.keys.size).to eq 2
      expect(province['id']).not_to be_nil
      expect(province['name']).not_to be_nil
    end
  end

end