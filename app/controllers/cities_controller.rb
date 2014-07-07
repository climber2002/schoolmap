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

  def show
    @province = Province.find params[:province_id]
    @city = @province.cities.find params[:id]

    respond_to do |format|
      format.js do
        add_breadcrumb @province.name, province_path(@province, format: :js)
        add_breadcrumb @city.name, province_city_path(@province, @city, format: :js)
      end

      format.json do
        feature = @city.to_feature
        render json: RGeo::GeoJSON.encode(feature)  
      end
    end
  end

end