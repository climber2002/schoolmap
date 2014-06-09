class Province < ActiveRecord::Base

  validates :name, presence: true

  has_many :cities

  include Featurable
  featurable :geom, [:name]
end
