class Province < ActiveRecord::Base

  validates :name, presence: true

  has_many :cities
end
