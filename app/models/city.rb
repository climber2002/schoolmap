class City < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :province
  validates :province, presence: true
  
  include Featurable
  featurable :geom, [:name, :id, :province_id]

  include Centerable
  has_center  

  has_many :schools

  # Select a random point from the city. This depends on the RandomPoint function
  # in PostGIS
  def self.random_point_in city
    select('id, RandomPoint(geom) as random_point').where('id = ?', city.id).first.random_point
  end

  scope :has_point, ->(point) { where("ST_Contains(geom, ST_GeomFromText('#{point.to_s}', 4326))") }

end
