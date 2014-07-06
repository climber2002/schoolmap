module Api
  module V1
    class CitiesController

      def index
        @province = Province.find(params[:province_id])
        @cities = @province.cities.select(:id, :name).order(:name)

        respond_to do |format|
          format.js { render json: @cities.as_json }
        end
      end

    end
  end
end