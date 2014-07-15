module Api
  module V1
    class SchoolsController < ApplicationController

      skip_before_filter :verify_authenticity_token

      include SchoolsSupport

      def create
        @school = School.new school_params
        
        set_geom_in_city

        if @school.save
          respond_to do |format|
            format.json { render json: @school.as_json }
          end
        else
          respond_to do |format|
            format.json { render json: { error: @school.errors.as_json } }
          end
        end  
      end

      private

      # override the geom in school 
      def set_geom_in_city
        point = City.random_point_in(@school.city)
        @school.geom = point
      end

    end
  end
end