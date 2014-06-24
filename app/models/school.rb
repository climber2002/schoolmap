class School < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  validates :geom, presence: true

  belongs_to :city
  validates :city, presence: true

  belongs_to :province

  belongs_to :grade
  validates :grade, presence: true

  belongs_to :category
  validates :category, presence: true
end
