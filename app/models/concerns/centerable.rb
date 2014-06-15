module Centerable
  extend ActiveSupport::Concern

  module ClassMethods
    def has_center geom_attr_name = :geom
      define_method :center do
        read_attribute(geom_attr_name).centroid.to_s
      end
    end
  end
end