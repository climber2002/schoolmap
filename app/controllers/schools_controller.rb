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

  private 

  def school_params
    puts "params: #{params}"
    params.require(:school).permit(:name, :address, :zipcode, :director, :website, :phone_number,
      :email, :geom, :city, :city_id, :city_name, :grade_id, :grade_name, :category_id, :category_name, 
      :capacity)
  end
end
