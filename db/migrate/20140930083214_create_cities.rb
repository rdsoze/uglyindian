class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :zoom_level

      t.timestamps
    end
    add_index :cities ,:name, unique: true
  end
end
