module SchoolsSupport

  private 

  def school_params
    params.require(:school).permit(:name, :address, :zipcode, :director, :website, :phone_number,
      :email, :geom, :city, :city_id, :city_name, :grade_id, :grade_name, :category_id, :category_name, 
      :capacity)
  end

end