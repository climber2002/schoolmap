class School < ActiveRecord::Base
  set_rgeo_factory_for_column(:geom, 
     RGeo::Geos.factory(srid: 4326))

  validates :name, presence: true, uniqueness: true

  validates :geom, presence: true

  belongs_to :city
  validates :city, presence: true

  belongs_to :province

  belongs_to :grade
  validates :grade, presence: true

  belongs_to :category
  validates :category, presence: true

  before_validation :set_province

  def grade_name=(grade_name)
    self.grade = Grade.find_by(name: grade_name)
  end

  def category_name=(category_name)
    self.category = Category.find_by(name: category_name)
  end

  def city_name=(city_name)
    self.city = City.find_by(name: city_name)
  end

  private
  def set_province
    self.province = self.city.province unless self.province
  end

end
