module Api
  module V1
    class ProvincesController < ApplicationController

      def index
        @provinces = Province.all.select(:id, :name).order(:name)

        respond_to do |format|
        format.json { render json: @provinces.as_json }
        end  
      end

    end
  end
end