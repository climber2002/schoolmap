class SchoolsController < ApplicationController

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
