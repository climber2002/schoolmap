module SchoolsHelper



  # returns the grade image marker for a school
  # the format of the image will be markermed_#{color}_#{char}.png
  def grade_marker_for_school school
    case school.grade.name.downcase
    when "pmaternelle"
      char = 'P'
      color = "blue"
    when "primaire"
      char = "R"
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

    image_path("markers/markermed_#{color}_#{char}.png")
  end

end
