class SchoolsController < ApplicationController

  include ActionView::Helpers::JavaScriptHelper

  layout false

  include SchoolsSupport

  def index
    @schools = School.all
    @schools = @schools.in_province(params[:province_id]) if params[:province_id]
    @schools = @schools.in_city(params[:city_id]) if params[:city_id]
    puts "category_id: #{params[:category_ids]}" if params[:category_ids]
    @schools = @schools.in_categories(params[:category_ids]) if params[:category_ids]

    set_school_stats
    
    respond_to do |format|
      format.js
    end
  end

  def new
    @geom = params[:geom]
    @city = City.has_point(@geom).first
    @school = School.new(geom: @geom, city: @city)
  end

  def create
    @school = School.new school_params

    if @school.save
      respond_to do |format|
        format.json { render json: @school.as_json }
        format.js
      end
    else
      respond_to do |format|
        format.json { render json: { error: @school.errors.as_json } }
        format.js
      end
    end  
  end

  def edit
    @school = School.find params[:id]
  end

  def update
    @school = School.find params[:id]
    @school.update_attributes(school_params)
  end

  private

  def set_school_stats
    # stats is a hash of hash, for the outer hash the key is the category name, and each category has a hash, 
    # for the inner hash, the key is the grade and the value is the count
    @school_count_stats = Hash.new do |hash, missing_key|
                            hash[missing_key] = Hash.new do |hash, missing_key|
                                                  hash[missing_key] = 0
                                                end
                          end
    @capacity_stats = Hash.new do |hash, missing_key|
                            hash[missing_key] = Hash.new do |hash, missing_key|
                                                  hash[missing_key] = 0
                                                end
                        end

    @schools.each do |school|
      @school_count_stats[school.category.name][school.grade.name] +=1
      @capacity_stats[school.category.name][school.grade.name] += school.capacity
    end
  end
end
