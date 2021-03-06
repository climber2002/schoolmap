class ProvincesController < ApplicationController

  def index
    @provinces = Province.all

    respond_to do |format|
      format.json do  
        feature_collection = Province.to_feature_collection @provinces
        render json: RGeo::GeoJSON.encode(feature_collection)
      end
    end
  end

  def show
    @province = Province.find params[:id]
    add_breadcrumb @province.name, province_path(@province, format: :js)

    respond_to do |format|
      format.js
    end
  end

end
