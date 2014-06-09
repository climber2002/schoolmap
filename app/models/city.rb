class City < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :province
  validates :province, presence: true
  
end
