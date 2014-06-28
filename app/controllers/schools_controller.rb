class SchoolsController < ApplicationController

  def create
    @school = School.new school_params

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

  def index
    @schools = School.all
    @schools = @schools.in_province(params[:province_id]) if params[:province_id]
    @schools = @schools.in_city(params[:city_id]) if params[:city_id]

    respond_to do |format|
      format.js
    end
  end

  private 

  def school_params
    puts "params: #{params}"
    params.require(:school).permit(:name, :address, :zipcode, :director, :website, :phone_number,
      :email, :geom, :city, :city_id, :city_name, :grade_id, :grade_name, :category_id, :category_name, 
      :capacity)
  end
end
