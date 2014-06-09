class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :unique => true, :null => false
      t.integer :province_id, :null => false
      t.multi_polygon :geom, :srid => 4326
      t.timestamps
    end

    change_table :cities do |t|
      t.index :geom, :spatial => true
    end
  end
end
