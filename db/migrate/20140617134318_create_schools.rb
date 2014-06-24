class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :address
      t.string :zipcode
      t.string :director
      t.string :website
      t.string :phone_number
      t.string :email
      t.point :geom, :srid => 4326
      t.references :city
      t.references :province 
      t.references :grade
      t.references :category
      t.integer :capacity, default: 0
      t.timestamps
    end
  end
end
