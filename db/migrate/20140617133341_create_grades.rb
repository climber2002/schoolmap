class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name, null: false
      t.integer :degree, default: 1
      t.string :description
      t.timestamps
    end
  end
end
