class CitiesController < ApplicationController

  def index
    @province = Province.find params[:province_id]
    @cities = @province.cities.all

    respond_to do |format|
      format.json do  
        feature_collection = City.to_feature_collection @cities
        render json: RGeo::GeoJSON.encode(feature_collection)
      end
    end  
  end

end