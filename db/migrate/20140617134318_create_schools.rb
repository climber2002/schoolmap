class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :street
      t.string :director
      t.string :website
      t.string :phonenumber
      t.point :geom, :srid => 4326
      t.references :city
      t.references :province 
      t.references :grade
      t.timestamps
    end
  end
end
