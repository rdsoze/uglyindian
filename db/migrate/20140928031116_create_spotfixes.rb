class CreateSpotfixes < ActiveRecord::Migration
  def change
    create_table :spotfixes do |t|
      t.integer :user_id #leader of the spotfix
      t.string :name
      t.text :description
      t.datetime :fix_date
      t.integer :city_id
      t.string :location
      t.float :latitude
      t.float :longitude
      t.boolean :active #not sure how to use

      t.timestamps
    end
  end
end
