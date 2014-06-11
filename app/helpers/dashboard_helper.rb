module DashboardHelper
  # Generates a google map array which contains the points that wrap
  # this polygon
  def polygon_to_gmap_points_array polygon
    result = "["

    polygon.exterior_ring.points.each do |point|
      result << "new google.maps.LatLng(#{point.y}, #{point.x}),\n"
    end
    result.slice! result.rindex(",\n"), ",\n".size
    result << "]";
  end
end
