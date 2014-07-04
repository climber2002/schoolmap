module SchoolsHelper

  # returns the grade image marker for a school
  # the format of the image will be markermed_#{color}_#{char}.png
  def grade_marker_path_for_school school
    marker_img_path_for_grade school.grade
  end

  # returns the marker image path for the grade
  def marker_img_path_for_grade grade
    image_path("#{marker_img_for_grade(grade)}")
  end

  def marker_img_tag_for_grade grade
    image_tag("#{marker_img_for_grade(grade)}")
  end

  # the info window content for school to display on google maps
  def info_window_content_for_school school
    content_tag(:div, style: "width:300px; height:180px;") do
      content = ""
      content << content_tag(:h4, school.name)
      content << content_tag(:strong, "Grade: ")
      content << school.grade.name
      content << "    "
      content << content_tag(:strong, "Category: ")
      content << school.category.name
      
      content << "<br/>"
      content << content_tag(:strong, "Address: ") << 
        escape_javascript("#{school.address} #{school.zipcode}") << "<br/>"

      [:director, :website, :email, :phone_number, :capacity].each do |attr|
        if school.read_attribute(attr).present?
          content << content_tag(:strong, "#{attr.to_s.humanize}: ") <<
            escape_javascript(school.read_attribute(attr).to_s) << "<br/>"
        end
      end

      content.html_safe
    end
  end

  private 

  # Return the img logic path of the marker for the specific grade
  def marker_img_for_grade grade
    case grade.name.downcase
    when "maternelle"
      char = 'M'
      color = "blue"
    when "primaire"
      char = "P"
      color = "orange"
    when "college"
      char = "C"
      color = "red"
    when "lycee"
      char = "L"
      color = "yellow"
    else
      char = "U"
      color = "black"
    end

    "markers/markermed_#{color}_#{char}.png"
  end

end
