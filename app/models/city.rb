class City < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :province
  validates :province, presence: true
  
  include Featurable
  featurable :geom, [:name, :id, :province_id]

  include Centerable
  has_center  
end
